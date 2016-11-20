//
//  SurveyTask.swift
//  Mental_Health
//
//  Created by Nicolas Wilmer on 11/20/16.
//  Copyright © 2016 Nicolas Wilmer. All rights reserved.
//

import Foundation
import ResearchKit

public var SurveyTask: ORKOrderedTask {
    let locationID = "location_step"
    let feelingID = "feeling_step"
    let formID = "form_step"
    
    var locationChoices = [ORKTextChoice]()
    locationChoices.append(ORKTextChoice(text: "Home", value: 0 as  NSCoding & NSCopying & NSObjectProtocol))
    locationChoices.append(ORKTextChoice(text: "Outdoors", value: 1 as  NSCoding & NSCopying & NSObjectProtocol))
    locationChoices.append(ORKTextChoice(text: "Public", value: 2 as  NSCoding & NSCopying & NSObjectProtocol))
    locationChoices.append(ORKTextChoice(text: "Social Gathering", value: 3 as  NSCoding & NSCopying & NSObjectProtocol))
    let locationAnswerFormat = ORKValuePickerAnswerFormat(textChoices: locationChoices)
    let locationQuestionStepTitle = "Where are you?"
    let locationQuestionStep = ORKFormItem(identifier: locationID, text: locationQuestionStepTitle, answerFormat: locationAnswerFormat)
    
    var feelingChoices = [ORKTextChoice]()
    feelingChoices.append(ORKTextChoice(text: "Sad", value: 0 as  NSCoding & NSCopying & NSObjectProtocol))
    feelingChoices.append(ORKTextChoice(text: "Anxious", value: 1 as  NSCoding & NSCopying & NSObjectProtocol))
    feelingChoices.append(ORKTextChoice(text: "Angry", value: 2 as  NSCoding & NSCopying & NSObjectProtocol))
 feelingChoices.append(ORKTextChoice(text: "Afraid", value: 3 as  NSCoding & NSCopying & NSObjectProtocol))
    feelingChoices.append(ORKTextChoice(text: "Hurt", value: 4 as  NSCoding & NSCopying & NSObjectProtocol))
    feelingChoices.append(ORKTextChoice(text: "Helpless", value: 5 as  NSCoding & NSCopying & NSObjectProtocol))
    feelingChoices.append(ORKTextChoice(text: "Confused", value: 6 as  NSCoding & NSCopying & NSObjectProtocol))
    feelingChoices.append(ORKTextChoice(text: "Stressed", value: 7 as  NSCoding & NSCopying & NSObjectProtocol))
    feelingChoices.append(ORKTextChoice(text: "Overwhelmed", value: 8 as  NSCoding & NSCopying & NSObjectProtocol))
    feelingChoices.append(ORKTextChoice(text: "Annoyed", value: 9 as  NSCoding & NSCopying & NSObjectProtocol))
    let feelingAnswerFormat = ORKValuePickerAnswerFormat(textChoices: feelingChoices)
    let feelingQuestionStepTitle = "How are you feeling?"
    let feelingQuestionStep = ORKFormItem(identifier: feelingID, text: feelingQuestionStepTitle, answerFormat: feelingAnswerFormat)
    
    let eatAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f3c3} \u{1f4a8}", minimumValueDescription: "\u{1f6b6}")
    let eatQuestionStep = ORKFormItem(identifier: "Eat", text: "Eat", answerFormat:eatAnswerFormat)
    
    let drinkAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f3c3} \u{1f4a8}", minimumValueDescription: "\u{1f6b6}")
    let drinkQuestionStep = ORKFormItem(identifier: "Drink", text: "Drink", answerFormat:drinkAnswerFormat)
    
    let sleepAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f3c3} \u{1f4a8}", minimumValueDescription: "\u{1f6b6}")
    let sleepQuestionStep = ORKFormItem(identifier: "Sleep", text: "Sleep", answerFormat:sleepAnswerFormat)
    
    let formStep = ORKFormStep(identifier: formID, title: "What's going on...", text: "")
    formStep.formItems = [locationQuestionStep, feelingQuestionStep, eatQuestionStep,drinkQuestionStep, sleepQuestionStep]
    formStep.isOptional = false
    
    var step = [ORKStep]()
    step += [formStep]

    
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: step)
}
