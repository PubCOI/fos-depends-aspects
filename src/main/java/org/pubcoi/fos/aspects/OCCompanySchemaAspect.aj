/*
 * Copyright 2021 PubCOI.org
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

package org.pubcoi.fos.aspects;

import com.opencorporates.schemas.OCCompanySchema;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ScopeMetadata;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.MongoId;

@Configuration
public aspect OCCompanySchemaAspect {

    declare @type: OCCompanySchema :@Document(collection = "oc_companies");

    public String OCCompanySchema .id;

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
