//
//  ConsentTask.swift
//  Mental_Health
//
//  Created by Nicolas Wilmer on 11/19/16.
//  Copyright © 2016 Nicolas Wilmer. All rights reserved.
//

import Foundation
import ResearchKit

public var ConsentTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: nil, in: ConsentDocument)
    
    reviewConsentStep.text = "Review Consent!"
    reviewConsentStep.reasonForConsent = "Consent to join study"
    
    steps += [reviewConsentStep]
    let nameStepID = "name_step"
    let genderStepID = "gender_step"
    let ageStepID = "age_step"
    let schoolStepID = "school_step"
    let conditionStepID = "condition_step"
    let happyID = "happy_step"
    let calmID = "calm_step"
    let empoweredID = "empowered_step"
    let safeID = "safe_step"
    
    
    let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    nameAnswerFormat.multipleLines = false
    let nameQuestionStepTitle = "What is your name?"
    let nameQuestionStep = ORKQuestionStep(identifier: nameStepID, title: nameQuestionStepTitle, answer: nameAnswerFormat)
    nameQuestionStep.isOptional = false
    steps += [nameQuestionStep]
    
    let genderQuestionStepTitle = "What is your gender?"
    let textChoices = [
        ORKTextChoice(text: "Male" , value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Female", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Prefer not to answer", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    let genderAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    let gendertQuestionStep = ORKQuestionStep(identifier: genderStepID, title: genderQuestionStepTitle, answer: genderAnswerFormat)
    steps += [gendertQuestionStep]
    
    let ageAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    ageAnswerFormat.multipleLines = false
    let ageQuestionStepTitle = "What is your age?"
    let ageQuestionStep = ORKQuestionStep(identifier: ageStepID, title: ageQuestionStepTitle, answer: ageAnswerFormat)
    steps += [ageQuestionStep]
    
    
    var schoolChoices = [ORKTextChoice]()
    schoolChoices.append(ORKTextChoice(text: "Duke University", value: 0 as  NSCoding & NSCopying & NSObjectProtocol))
    let schoolAnswerFormat = ORKValuePickerAnswerFormat(textChoices: schoolChoices)
    let schoolQuestionStepTitle = "What school do you attend?"
    let schoolQuestionStep = ORKQuestionStep(identifier: schoolStepID, title: schoolQuestionStepTitle, answer: schoolAnswerFormat)
    steps += [schoolQuestionStep]
    
    let conditionsQuestionStepTitle = "Do you have any pre-existing medical conditions? (Select all that apply)"
    let conditiontextChoices = [
        ORKTextChoice(text: "Anxiety" , value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Depression", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Bipolar", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Eating Disorder", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Substance Abuse & Addiction", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Other", value: 5 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Prefer not to answer", value: 6 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    let conditionsAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: conditiontextChoices)
    let conditionsQuestionStep = ORKQuestionStep(identifier: conditionStepID, title: conditionsQuestionStepTitle, answer: conditionsAnswerFormat)
    steps += [conditionsQuestionStep]
    
    
    
    
    let happyActiveAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f3c3} \u{1f4a8}", minimumValueDescription: "\u{1f6b6}")
    let happyActiveQuestionStep = ORKFormItem(identifier: "HappyActive", text: "How much do you enjoy physical activity?", answerFormat:happyActiveAnswerFormat)
    
    let happySocialAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f46f} \u{1f46f}", minimumValueDescription: "\u{1f3fb}")
    let happySocialQuestionStep = ORKFormItem(identifier: "HappySocial", text: "What’s your ideal social situation?", answerFormat:happySocialAnswerFormat)
    
    let happyOrganizedAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f44D}", minimumValueDescription: "\u{1f44E}")
    let happyOrganizedQuestionStep = ORKFormItem(identifier: "HappyOrganized", text: "How pertinent is organization to your happiness?", answerFormat:happyOrganizedAnswerFormat)
    
    let happyLoudAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f31E}", minimumValueDescription: "\u{1f32A}")
    let happyLoudQuestionStep = ORKFormItem(identifier: "HappyLoud", text: "What type of space do you find most enjoyable?", answerFormat:happyLoudAnswerFormat)
    
    let happyProductiveAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f44D}", minimumValueDescription: "\u{1f959}")
    let happyProductiveQuestionStep = ORKFormItem(identifier: "HappyProductive", text: "Do you enjoy getting things done?", answerFormat:happyProductiveAnswerFormat)
    
    let happyStep = ORKFormStep(identifier: happyID, title: "Tell us about yourself...", text: "")
    happyStep.formItems = [happyActiveQuestionStep, happySocialQuestionStep, happyOrganizedQuestionStep,happyLoudQuestionStep, happyProductiveQuestionStep]
    happyStep.isOptional = false
    steps += [happyStep]
    
    
    let calmActiveAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f44c}", minimumValueDescription: "\u{1f959}")
    let calmActiveQuestionStep = ORKFormItem(identifier: "CalmActive", text: "Does being active relax you?", answerFormat:calmActiveAnswerFormat)
    
    let calmSocialAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f60c}", minimumValueDescription: "\u{1f613}")
    let calmSocialQuestionStep = ORKFormItem(identifier: "CalmSocial", text: "Do you feel stressed in social situations?", answerFormat:calmSocialAnswerFormat)
    
    let calmOrganizedAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f642}", minimumValueDescription: "\u{1f623}")
    let calmOrganizedQuestionStep = ORKFormItem(identifier: "CalmOrganized", text: "Do you feel anxious when things are unorganized?", answerFormat:calmOrganizedAnswerFormat)
    
    let calmLoudAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f514}", minimumValueDescription: "\u{1f515}")
    let calmLoudQuestionStep = ORKFormItem(identifier: "CalmLoud", text: "Do you need a quiet space to feel relaxed?", answerFormat:calmLoudAnswerFormat)
    
    let calmProductiveAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f60d}", minimumValueDescription: "\u{1f611}")
    let calmProductiveQuestionStep = ORKFormItem(identifier: "CalmProductive", text: "Does finishing a task relax you?", answerFormat:calmProductiveAnswerFormat)
    
    let calmStep = ORKFormStep(identifier: calmID, title: "Tell us about yourself...", text: "")
    calmStep.formItems = [calmActiveQuestionStep, calmSocialQuestionStep, calmOrganizedQuestionStep,calmLoudQuestionStep, calmProductiveQuestionStep]
    calmStep.isOptional = false
    steps += [calmStep]
    
    let empoweredActiveAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f4aa}", minimumValueDescription: "\u{1f933}")
    let empoweredActiveQuestionStep = ORKFormItem(identifier: "EmpoweredActive", text: "Does physical activity make you feel good about yourself?", answerFormat: empoweredActiveAnswerFormat)
    
    let empoweredSocialAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f481}", minimumValueDescription: "\u{1f937}")
    let empoweredSocialQuestionStep = ORKFormItem(identifier: "EmpoweredSocial", text: "Do you ever feel confused when trying to express your feelings or emotions?", answerFormat: empoweredSocialAnswerFormat)
    
    let empoweredOrganizedAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{263a}", minimumValueDescription: "\u{1f615}")
    let empoweredOrganizedQuestionStep = ORKFormItem(identifier: "EmpoweredOrganized", text: "Do you feel proud when you clean your room?", answerFormat: empoweredOrganizedAnswerFormat)
    
    let empoweredLoudAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f5e3}", minimumValueDescription: "\u{1f64a}")
    let empoweredLoudQuestionStep = ORKFormItem(identifier: "EmpoweredLoud", text: "Do you like to shout your success from the rooftops?", answerFormat: empoweredLoudAnswerFormat)
    
    let empoweredProductiveAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f934}", minimumValueDescription: "\u{1f647}")
    let empoweredProductiveQuestionStep = ORKFormItem(identifier: "EmpoweredProductive", text: "Do you feel accomplished when you finish an assignment?", answerFormat: empoweredProductiveAnswerFormat)
    
    let empoweredStep = ORKFormStep(identifier: empoweredID, title: "Tell us about yourself...", text: "")
    empoweredStep.formItems = [empoweredActiveQuestionStep, empoweredSocialQuestionStep, empoweredOrganizedQuestionStep,empoweredLoudQuestionStep, empoweredProductiveQuestionStep]
    empoweredStep.isOptional = false
    steps += [empoweredStep]
    
    
    let safeOrganizedAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f44d}", minimumValueDescription: "\u{1f44e}")
    let safeOrganizedQuestionStep = ORKFormItem(identifier: "SafeOrganized", text: "Do you feel unsafe in social situations?", answerFormat: safeOrganizedAnswerFormat)
    
    let safeLoudAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f606}", minimumValueDescription: "\u{1f62b}")
    let safeLoudQuestionStep = ORKFormItem(identifier: "SafeLoud", text: "Does having control of the variables in your space make you feel safe?", answerFormat: safeLoudAnswerFormat)
    
    let safeSocialAnswerFormat: ORKContinuousScaleAnswerFormat = ORKAnswerFormat.continuousScale(withMaximumValue: 100.0, minimumValue: 0.0, defaultValue: 50, maximumFractionDigits: 0, vertical: false, maximumValueDescription: "\u{1f44d}", minimumValueDescription: "\u{1f44e}")
    let safeSocialQuestionStep = ORKFormItem(identifier: "SafeProductive", text: "Do loud noises scare you?", answerFormat: safeSocialAnswerFormat)
    
    let safeStep = ORKFormStep(identifier: safeID, title: "Tell us about yourself...", text: "")
    safeStep.formItems = [ safeSocialQuestionStep, safeOrganizedQuestionStep,safeLoudQuestionStep]
    safeStep.isOptional = false
    steps += [safeStep]
    
    

    
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}
