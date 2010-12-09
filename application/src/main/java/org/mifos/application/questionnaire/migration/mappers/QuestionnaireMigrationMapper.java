/*
 * Copyright (c) 2005-2010 Grameen Foundation USA
 *  All rights reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 *  implied. See the License for the specific language governing
 *  permissions and limitations under the License.
 *
 *  See also http://www.apache.org/licenses/LICENSE-2.0.html for an
 *  explanation of the license and how it is applied.
 */

package org.mifos.application.questionnaire.migration.mappers;

import org.mifos.application.master.business.CustomFieldDefinitionEntity;
import org.mifos.application.util.helpers.EntityType;
import org.mifos.application.questionnaire.migration.CustomFieldForMigrationDto;
import org.mifos.customers.surveys.business.Survey;
import org.mifos.customers.surveys.business.SurveyInstance;
import org.mifos.platform.questionnaire.service.dtos.QuestionDto;
import org.mifos.platform.questionnaire.service.dtos.QuestionGroupDto;
import org.mifos.platform.questionnaire.service.dtos.QuestionGroupInstanceDto;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

public interface QuestionnaireMigrationMapper {
    QuestionDto map(CustomFieldDefinitionEntity customField, Integer questionOrder);

    QuestionGroupDto map(Iterator<CustomFieldDefinitionEntity> customFields, Map<Short, Integer> customFieldQuestionIdMap, EntityType entityType);

    QuestionGroupDto map(Survey survey);

    QuestionGroupInstanceDto map(SurveyInstance surveyInstance, Integer questionGroupId, Integer eventSourceId);

    QuestionGroupInstanceDto map(Integer questionGroupId, Integer eventSourceId, List<CustomFieldForMigrationDto> customerResponses, Map<Short, Integer> customFieldQuestionIdMap);
}