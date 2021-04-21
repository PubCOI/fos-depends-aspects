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

import org.pubcoi.cdm.pw.RegisterRecordType;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import javax.xml.bind.annotation.XmlTransient;

@Configuration
public aspect RegisterEntryTypeAJ {

    declare @type: org.pubcoi.cdm.pw.RegisterRecordType :@Document(collection = "pw_parent_records");

    declare @field: String org.pubcoi.cdm.pw.RegisterRecordType.id :@Id;

    declare @field: String org.pubcoi.cdm.pw.RegisterRecordType.id :@XmlTransient;

    public String RegisterRecordType.id;

    public String RegisterRecordType .getId() {
        return this.id;
    }

    public RegisterRecordType RegisterRecordType .setId(String id) {
        this.id = id;
        return this;
    }

}
