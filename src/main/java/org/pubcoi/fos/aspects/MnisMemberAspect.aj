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

import org.pubcoi.cdm.mnis.MnisMemberType;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import javax.xml.bind.annotation.XmlTransient;

@Configuration
public aspect MnisMemberAspect {

    declare @type: MnisMemberType :@Document(collection = "mnis_members");

    declare @field: Integer MnisMemberType.memberId :@Id;

    declare @field: String MnisMemberType.pwId :@XmlTransient;

    public String MnisMemberType.pwId;

    public String MnisMemberType .getPwId() {
        return this.pwId;
    }

    public MnisMemberType MnisMemberType .setPwId(String id) {
        this.pwId = id;
        return this;
    }

}
