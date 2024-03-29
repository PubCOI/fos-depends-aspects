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

import com.fasterxml.jackson.annotation.JsonView;
import org.pubcoi.cdm.pw.RegisterRecordType;
import org.pubcoi.fos.views.FosViews;
import org.springframework.context.annotation.Configuration;
import org.pubcoi.cdm.cf.search.response.NoticeSearchResponse;
import org.pubcoi.cdm.cf.base.NoticeIndex;
import org.pubcoi.cdm.cf.search.response.NoticeHitType;
import org.springframework.data.annotation.Id;

import javax.xml.bind.annotation.XmlTransient;
import java.util.List;
import java.time.OffsetDateTime;
import java.lang.Double;

@Configuration
public aspect NoticeIndexViewsAJ {

    declare @field: String
            NoticeIndex.id
            :@JsonView(FosViews.Summary.class);

    declare @field: int
            NoticeSearchResponse.hitCount
            :@JsonView(FosViews.Summary.class);

    declare @field: NoticeSearchResponse.NoticeList
            NoticeSearchResponse.noticeList
            :@JsonView(FosViews.Summary.class);

    declare @field: List<NoticeHitType>
            NoticeSearchResponse.NoticeList.hitOfNoticeIndices
            :@JsonView(FosViews.Summary.class);

    declare @field: float
            NoticeHitType.score
            :@JsonView(FosViews.Summary.class);

    declare @field: NoticeIndex
            NoticeHitType.item
            :@JsonView(FosViews.Summary.class);

    declare @field: String
            NoticeIndex.title
            :@JsonView(FosViews.Summary.class);

    declare @field: String
            NoticeIndex.awardedSupplier
            :@JsonView(FosViews.Summary.class);

    declare @field: OffsetDateTime
            NoticeIndex.publishedDate
            :@JsonView(FosViews.Summary.class);

    declare @field: OffsetDateTime
            NoticeIndex.awardedDate
            :@JsonView(FosViews.Summary.class);

    declare @field: OffsetDateTime
            NoticeIndex.start
            :@JsonView(FosViews.Summary.class);

    declare @field: OffsetDateTime
            NoticeIndex.end
            :@JsonView(FosViews.Summary.class);

    declare @field: Double
            NoticeIndex.valueLow
            :@JsonView(FosViews.Summary.class);

    declare @field: Double
            NoticeIndex.valueHigh
            :@JsonView(FosViews.Summary.class);

    declare @field: Double
            NoticeIndex.awardedValue
            :@JsonView(FosViews.Summary.class);

    public boolean NoticeIndex.alreadyLoaded = false;

    public boolean NoticeIndex.getAlreadyLoaded() {
        return this.alreadyLoaded;
    }

    public NoticeIndex NoticeIndex.setAlreadyLoaded(boolean loaded) {
        this.alreadyLoaded = loaded;
        return this;
    }

    declare @field: boolean NoticeIndex.alreadyLoaded :@XmlTransient;

    declare @field: boolean
            NoticeIndex.alreadyLoaded
            :@JsonView(FosViews.Summary.class);

}
