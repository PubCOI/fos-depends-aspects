package org.pubcoi.fos.aspects;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Configuration
public aspect FullNoticeAJ {

    declare @type: org.pubcoi.fos.models.cf.FullNotice :@Document(collection = "cf_notices");

    declare @field: String org.pubcoi.fos.models.cf.FullNotice.id :@Id;
}
