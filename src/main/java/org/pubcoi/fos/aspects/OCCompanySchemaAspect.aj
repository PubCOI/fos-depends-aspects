package org.pubcoi.fos.aspects;

import com.opencorporates.schemas.OCCompanySchema;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ScopeMetadata;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.MongoId;

@Configuration
public aspect OCCompanySchemaAspect {

    declare @type: com.opencorporates.schemas.OCCompanySchema :@Document(collection = "oc_companies");

    public String com.opencorporates.schemas.OCCompanySchema.id;

    public String OCCompanySchema .getId() {
        return this.id;
    }

    after (OCCompanySchema companySchema): execution(void OCCompanySchema.setCompanyNumber(String)) && args(String) && target(companySchema) {
        companySchema.id = generateID(companySchema);
    }

    after (OCCompanySchema companySchema): execution(void OCCompanySchema.setJurisdictionCode(String)) && args(String) && target(companySchema) {
        companySchema.id = generateID(companySchema);
    }

    /**
     * Generates a standard ID, canonicalising the company object
     * @param company the company object for which to create an ID
     * @return A company ID, including jurisdiction and company number
     */
    public static String generateID(OCCompanySchema company) {
        return String.format("oc_company:%s:%s", company.getJurisdictionCode(), company.getCompanyNumber());
    }
}
