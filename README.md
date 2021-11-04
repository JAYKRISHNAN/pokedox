# Coding Task
### Sample Screenshot

![Pokedox sample screenshot](https://user-images.githubusercontent.com/4848551/140314087-f88a802c-fce2-4ab1-bcda-38a77c49f24b.png)




### Context:

The goal of this task is to get a glimpse of your code style and how you think through a relatively simple problem, paying attention to readability, extendability and good design practices. You should expect to spend approximately 2 hours working on this task.

This is a Sinatra application. The barebones of the application has already been set up for you. If you are unfamiliar with Sinatra, you can find further information [here](http://sinatrarb.com/). You can run the application using the provided setup with `shotgun config.ru`.

### Instructions:
Clone this repository and push the results to your own github accout. When you're finished, send us a link to the repo.

### Acceptance Criteria:
When a user visits the index page of this application, use the [pokemon API](https://pokeapi.co/docs/v2#pokemon) to fetch a random Pokemon and display the following data:

* Name
* An image of the pokemon
* Statistics about the pokemon:
   * Height
   * Weight
   * Species
* Name of the location area where the pokemon can be encountered, formatted in plain English

### Notes: 
* For data about Pokemon, the source of truth is the Pokemon API. For images, please use what you think is best.
* Expect low traffic of ~2 requests per second.
* Users will access the site on modern devices only, no need to think about legacy browsers.
* A simple sanity check test exists in spec/app_spec.rb. Please test your code.
* If you need clarification on any of these points (where you would normally check in with product), please make a decision yourself and note down what the assumption you made was. 

We encourage you to think about the requirements and the above notes and be able to explain your reasoning. 

#### As this is a backend task, having a fancy frontend is not necessary, as long as it is easily readable and completes the requirements. Clean backend code is much more important.
