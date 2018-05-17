# Instruction for starting with Alexa:

To access and use Amazon services such as Lambda services we have
created four accounts, **you will be provided with the accounts during the Hack.**

## Login to AWS console
You can use the credentials provided to login to the Amazon AWS console at
https://aws.amazon.com/console/ and also the Amazon developer site at https://developer.amazon.com/ (where you can access Alexa API:s among other things).

## Get started tutorials
To get started with the Alexa Skills Kit there are some tutorials that
can be found by googling "amazon alexa tutorial", among others

https://developer.amazon.com/alexa-skills-kit/alexa-skill-python-tutorial 

or

https://developer.amazon.com/alexa-skills-kit/tutorials/fact-skill-1 

You can use these tutorials to understand what can be done with Alexa and get inspiration for your project.

## Alexa Skills

Alexa provides a set of built-in capabilities, referred to as _skills_. Alexa Skills Kit lets you teach Alexa _new skills_. 
You can build skills that provide users with many different types of abilities, such as look up answers to specific questions, challenge the user with games, control lights and IoT devices.

The first task for the developer, designer or thinker is to understand _what your skill will do_. Every skill has an _interaction model_ that determines the request the skill handle and the words users say to invoke those requests. You can define this yourself with a [_custom model_](https://developer.amazon.com/docs/ask-overviews/understanding-the-different-types-of-skills.html#custom-interaction-model)([here](https://developer.amazon.com/docs/ask-overviews/requirements-to-build-a-skill.html#what-do-you-need-for-a-custom-skill) you will find all the requirements you need in order to build a custom skill) or with a [_pre-built model_](https://developer.amazon.com/docs/ask-overviews/understanding-the-different-types-of-skills.html#smart-home-skills-pre-built-model)([here](https://developer.amazon.com/docs/ask-overviews/requirements-to-build-a-skill.html#what-do-you-need-for-a-custom-skill) the requirements) in which the possible requests and utterances are pre-defined for you.  a list skill facilitates the use of list events in the skill service. Moreover, it is important the concept of _list skills_, it facilitates the use of [list events](https://developer.amazon.com/docs/smapi/list-events-in-alexa-skills.html) in the skill service. Thus, the skills can understand and react to changes that happen to lists from top-level utterances on Alexa.

### Understanding the interaction with Alexa

When the user speaks to one of the Echo Dot used in Live Hacks, they have Alexa installed that recognizes the speech, determines what the user wants, and then sends a request to the particular skill that can fulfill the user's request. All speech recognition and conversion is handled by Alexa in the cloud.

Every Alexa skill has an [_interaction model_](https://developer.amazon.com/docs/ask-overviews/understanding-how-users-interact-with-skills.html#what-is-an-interaction-model) defining the words and phrases users can say to make the skill do what they want. This model determines how Alexa communicates with the users. During Live Hacks you will be able to work on [examples of interaction models](https://developer.amazon.com/docs/ask-overviews/understanding-how-users-interact-with-skills.html#what-is-an-interaction-model) only focused on voice interaction. After understanding the concept of interaction model, we recommend each team member to start building a [Custom Skills on Alexa](https://developer.amazon.com/docs/custom-skills/understanding-custom-skills.html), perhaps using the Spotify API designed for Alexa.

## Spotify API

TBD
