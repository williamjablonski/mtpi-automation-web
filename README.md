# MTPI/Santander automation framework  #

This is a small framework that uses Cucumber and Page Object to execute test on Selenium Webdriver for MTPI/Santander Solutions.

### Environment set up ###

Ruby 2.2-3 is recommended to run the tests. We will use [RVM](https://rvm.io) to control the ruby version. For Windows you can use the [RubyInstaller](http://rubyinstaller.org/)

```
$ rvm install ruby-2.2.3
```

### USAGE ###

To install the dependencies for the project run ```$ bundle install ``` in the project root folder.

To run the automation on your local you can follow the example below.
```
bundle exec cucumber features/SearchAgency.feature URL=https://www.santander.com.br/br/ BROWSER=firefox
```

To run the automation in Browser Stack you can follow the example below. (feature filter)
```
bundle exec cucumber features/SearchAgency.feature URL=https://www.santander.com.br/br/ BROWSER=browserstack BR_STACK_USER=williamjablonski1 BR_STACK_PASS=zEqdMBRVVqr3sM95SLaj
```
or (to all features)
```
bundle exec cucumber URL=https://www.santander.com.br/br/ BROWSER=browserstack BR_STACK_USER=williamjablonski1 BR_STACK_PASS=zEqdMBRVVqr3sM95SLaj
```

The following execution variables can be used:

1. BROWSER(Optional) - The default option is headless to use with Xvfb on CI server. To run on your local computer use firefox, chrome or ie.
2. URL - Defines the environment where the tests will be executed, i.e: "https://www.santander.com.br/br/"
3. BR_STACK_USER - User to Browser Stack
4. BR_STACK_PASS - Password to Browser Stack

### Automation Guidelines ###

* Scenarios should describe the feature, not edge cases.
* All scenarios should have a tag to identify which functionality/story it is being tested.
* Scenarios without step definitions or unfinished should contain `@WIP` tags.
```
@RD-100
Scenario: Search bank places arround of me
```