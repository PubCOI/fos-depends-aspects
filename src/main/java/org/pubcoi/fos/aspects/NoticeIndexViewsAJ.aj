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
import org.pubcoi.fos.views.FosViews;
import org.springframework.context.annotation.Configuration;
import org.pubcoi.cdm.cf.search.response.NoticeSearchResponse;
import org.pubcoi.cdm.cf.base.NoticeIndex;
import org.pubcoi.cdm.cf.search.response.NoticeHitType;

import java.util.List;
import java.lang.Float;

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
            NoticeSearchResponse.NoticeList.hitOfNoticeIndex
            :@JsonView(FosViews.Summary.class);

    declare @field: Float
            NoticeHitType.score
            :@JsonView(FosViews.Summary.class);

    declare @field: NoticeIndex
            NoticeHitType.item
            :@JsonView(FosViews.Summary.class);


}
