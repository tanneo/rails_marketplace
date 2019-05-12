Project documentation is to be compiled as a single markdown file named README.md

This file should contain,

A link (URL) to your published App

- https://railsmarketplace.herokuapp.com/

A link to your GitHub repository

- https://github.com/tanneo/rails_marketplace

Description of your project, including,
Problem definition / purpose

- See question 1,2,3 of short answers

Functionality / features

- Sign in
- Each user can buy and sell goods. I will update this in the future so it is a business to conumser model. Australian businesses will only be able to sell and Chinese consumers will only be able to buy
- Add listings
- Edit listings
- Delete listings
- View listings
- Make an order
- Pay for order
- View sales history
- View purchases history
- Update account info
- Cancel account

Screenshots


Tech stack (e.g. html, css, deployment platform, etc)

- See question 5 of short answers
Instructions on how to setup, configure and use your App.

Design documentation including,

Design process

- See question relating to design process

User stories

-  See TeganOar_A2-1/docs

A workflow diagram of the user journey/s

-  See TeganOar_A2-1/docs

Wireframes

- See TeganOar_A2-1/docs

Database Entity Relationship Diagrams

-  See TeganOar_A2-1/docs

Details of planning process including,

Project plan & timeline

- As this was compoleted solo, week one focused on
    - User stories
    - Workflow diagram
    - Wireframes
    - Creating static views

- Week two focused on 
    - Building all features to reach MVP
    - Testing
    - Documenation
    - Pushing to Heroku

Screenshots of Trello board(s)
Answers to the Short Answer questions (Section 2.2)

1) What is the need (i.e. challenge) that you will be addressing in your project?
2) Identify the problem you’re trying to solve by building this particular marketplace App? Why is it a problem that needs solving?
3) Describe the project will you be conducting and how. your App will address the needs.

The app is to build a marketplace to exchange goods from businesses in Australia to consumers in Asia. 

The challenges and problems that I am addressing are the following 

- Demand issues in China to source Australian goods and to source these directly through Australian manufacturers. 

- Food and safety concerns for Chinese buying some products locally. For example - Chinese are sourcing baby formula from Western countries.

- Due to high demand in Asia, there has been an issue with scalping in Australia where people have been caught purchasing items (like baby formula) from supermarkets and selling to Asian consumers to make a profit

- No availability of these items in Australia supermarkets due to third party organisations using stock. 
Trust issues of Chinese consumers to pay upfront before goods delivered

The vision for this application is that I will be addressing these implementing a system that allows
Australian Business to sell directly to Asian consumers which alleviates the demand issues in Asia

- Alleviates some food and safety concerns in Asia by allowing Chinese to source some of these high quality products through trusted Australian manufacturers

- Eliminates scalping as Chinese consumers can buy directly through Australian manufacturers

- Ensures Australian supermarket shelves remain fully stocked for local consumers as it minimises third party on sellers. 


Asian consumers have trust issues when they are purchasing items and having to pay upfront. Therefore, Ebay wasn’t a huge success in China as it is mandatory to pay before the good arrive. 

Taobao (China’s biggest consumer to consumer marketplace) fixed this issue through a third party payment system where the goods are paid for upfront and funds are held until the item is delivered. 

However, Taobao is only sourcing items locally in China and is consumer to consumer, which leads me to the second issue that I am addressing. 

This issue is that the Chinese don’t trust manufacturers for (some) low cost products in China as their belief is that they’re inferior quality. Therefore, they have been sourcing goods from the likes of Australia and other Western countries to ensure quality.

Just a few examples of these products are baby nappies, milk and even the global brand Glad n’ seal that costs the same in the US and China, but in China you can press and not seal.

Food and safety is also a big concern in China, where they are still sourcing milk from Western countries after the 2008 contamination incident. 

The app will be addressing alleviating the demand needs by allowing Asian consumers to source foreign goods from Australia. This is through a business to consumer model, with the businesses being in Australia and the consumers in China. This will also allow accessibility to quality products in Asia without third parties buying products from Australian supermarkets at and selling them to Chinese consumers at a higher price. 

The main difference between Ebay, Taobao and the application that I cam creating (Made for China) is the following 

Ebay is consumer to consumer and you have to pay upfront
Taobao do hold funds (which eliminates the trust issue) but is only for items sourced locally in China, so there is still the issue of quality control. This is also consumer to consumer
Made in China - The new application I am developing is for business in Australia to sell to consumers in China. Not in the MVP but the idea is that a payment gateway could be used that also holds the funds until the product is delivered. Therefore, Asian consumers have access to quality products, whilst alleviating their trust issues until the product is delivered. 



4) Describe the network infrastructure the App may be based on.
The application was deployed with Heroku. Heroku runs on AWS. AWS is an Infrastructure as a Service(IaaS) provider, meaning they are responsible for managing large, shared data centers.

Once the code is transferred through Git, Heroku builds a slug, which is a compressed archive containing the application code, configuration and dependencies. 

Heroku is known for running apps in dynos – which are really just virtual computers that can be powered up or down based on how big the application is. 

 A dyno can take a slug and run it, making the application available to the world. If you want to process more data or run more complex tasks, you are going to need to add more blocks(what is called scaling horizontally) or increase the size of the blocks (what is called scaling vertically). 

A slug is built up on one or more dynos. Heroku's HTTP routers distribute incoming requests for the application across the running web dynos. A random selection algorithm is used for HTTP/HTTPS request load balancing across web dynos. It also supports multiple simultaneous connections, as well as timeout handling.

5) Identify and describe the software to be used in your App.

The software that was used in the application was particularly to adhere with the assignments requirements to be built with Ruby on Rails and learn the MVC model. 

The Ruby on rails tech stack consisted of HTML, SCSS(CSS), Ruby, and Ruby on rails, being the server side web application framework. 

I chose for the application to be deployed with Heroku. After examining AWS and Heroku, it became evident that Heroku was much simpler to use and was sufficient for a small application.

This platform equips users with a ready runtime environment and application servers. It also benefits from a seamless integration with various development instruments, a pre-installed operating system, and redundant servers. Therefore,  I didn’t need to think about infrastructure management, unlike with AWS EC2. 


Stripe was used as an add on Application through the API to process customers payments in order for their credit card details to never hit our server. 

I used standard Ruby gems along with a few other to do the heavy lifting when it come to preparing code and integrations through API’s. Some of these included Devise, Stripe, Image Magic, Mini Magic and Cloudinary. 


6) Identify the database to be used in your App and provide a justification for your choice.

As stated above I chose to deploy with Heroku due to efficiency gains as I didn’t need a complex understanding of  how to manually configure and maintain virtualized servers that run the application.

In turn, I chose PostGreSQL as a database as it is the only database supported by Heroku.

This choice was also affected by a prior decision to use an EC2 instance when I outsourced development for an application that I was building. It became apparent to me that it was far more complex and usually a specific Dev Ops engineer is required to provision the instances, control the application, deployment and need a deep understanding to orchestrate the infrastructure. 

Choosing a database in this instance was simple due to deploying with Heroku, but in other instances I would weigh up the pros and cons between PostgreSQL and MySQL depending on the applications needs. 


7) Identify and describe the production database setup (i.e. postgres instance).

My database consisted of three tables. A User table that stores the name, address and email of the user. The user table has many listings, has many sales and has many purchases. The foreign keys in this table are the Buyer_ID and the Seller_ID that belongs to the orders table. 
There is then a listing table, which stores the listings details including the name, description, the price and the user id. The listings table belongs to a user, has many orders and also has an attached image. 
The order table belongs to the listing and stores additional information, being the name, address, city, and state as well as the Listing_ID, Buyer_ID and Seller_ID. This also belongs to a user that is a buyer and a user that is a seller so flows back into the user table. 


8) Describe the architecture of your App. &
9) Explain the different high-level components (abstractions) in your App.

My app follows the Model-View-Controller architecture of Rails Apps. Through separation, this model increases scalability because you can upgrade the hardware without other components being affected. It also improves ease of maintenance as the components have a low dependency on each other and it also enhances re-usability as a model may be reused in multiple views.
This separation results in user requests being processed as follows:
The browser (on the client) sends a request for a page to the controller on the server.
The controller retrieves the data it needs from the model in order to respond to the request.
The controller gives the retrieved data to the view.
The view is rendered and sent back to the client for the browser to display.

Models
The app consists of the following models and these were used for handling the data and the business logic. The models can be seen as an abstraction of the database schema provided above.
Listing
Order
User
Views
The views consists of five folders and were responsible for handling graphical user interface objects and presentation
Layouts 
Contains the header and the footer that is rendered into application.html.erb
Also contains the application.html file which is for information that is consistent across all views in the application
Listings
Contains all of the views for users to perform the CRUD operations on listings (through the controller)
Orders
The order views are similar to the listing views above where users can create orders and will ensure upon completion of the order that the user is redirected to Stripe so their credit card information never hits our server.
Pages - This contains the the About and the Contact Page (It is a possibility that this may be deleted upon completion if not necessary for the overall project)
Devise - This folder has many views for the collection and handling of user registration data.
The view never interact with the model as this is all done through the controller.
Controllers
The application has 3 controllers, which are used to make sense out of the requests in an application, communicate to the model to check if the request sent is available in the database and render the information back to the view. 
Listings Controller - This is responsible for displaying all the listings to the user. It also allows the user perform all of the CRUD actions on their listings.
Orders Controller - Responsible for the users CRUD actions on the orders. This controller also takes the user to the Stripe payment checkout for payment and re-directs them to an view that renders that the order is successful.
Pages Controller - Controller for the About and contact pages, which are the static pages of the application


10) Detail any third party services that your App will use.

This application uses a variety of third party services. 

Firstly, whilst building the application gems are used as plugins provided to create extra functionality to meet the needs of the applicaiton. 

The following gems were used:

Mini_magick & image_magick to create, edit and re-size images
Devise - to perform user authentication
Stripe - To provide access to Stripe API
Cloudinary - To provide access to Cloudinary’s API
Activestorage-cloudinary-service - provide necessary interfaces required to hook up cloudinary to the the Active Storage API
Dotenv-rails - required to keep sensitive passwords separate 

In terms of third party applications, Stripe was used as for online payment processing via their API, which we set up on the server side. Once the customer hits the ‘Order’ button they are redirected to Stripes website to enter their payment details. Stripe will prepare the order order form based on instructions from the order controller in our application. This allows for Stripe to handle the clients payment and take all credit card responsibility away from our server. 

Cloudinary was used to securely upload and store images in a hosted environment for when our application is deployed from development on localhost:3000 to production on Heroku.
As mentioned in a prior question, Heroku was used for easy deployment of the application - Refer to question 4. For version Control, I have used Git and Github to safely and remotely store data between sessions


11) Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb).

eBay or Etsy would have a similar data structures in comparison to Made for China as the current MVP is a simple version of a two sided marketplace application where each user can buy and sell products. This is because my initial design was based upon a marketplace where both Australian and Asian consumers could buy and sell goods to each other.

However, after more investigation into the needs of the market, I would release the MVP as a one sided marketplace, being that only Chinese consumers can buy from Australian suppliers, so the next iteration, would be a B2C model, rather than a C2C model. 

In eBay or Etsy, users login and are able to scroll through products that they want to buy off other consumers, so they are also a consumer to consumer model. 

Users in both eBay and Etsy can also have a buyers account and sellers account. This is similar to the current version of the app. 


12)Discuss the database relations to be implemented &
13)Describe your project’s models in terms of the relationships (active record associations) they have with each other.

The user table has a primary key that links it to the listings table and the relation is one user to many listings. The user table also has foreign keys for seller_id and buyer_id that reference the order table. This relationship is that both buyers and sellers can have many orders and orders belong to the buyer and seller foreign keys in the User table. 

The listing table belongs to Users and the relationship is zero to many in the direction of users to listings as a user can sign up and have no listings, but can also have many listings. 

The relationship between the listings and the orders table is that a listing can have many orders.

Orders can also have many buyers and sellers, which is currently referenced by the buyer and the seller belonging to the buyer and seller foreign keys in the user table.

This could be enhanced in the future by having another table for customers. This way you can separate out buyers and sellers, rather than grouping these two types of customers into the ‘User’ model.

14) Provide your database schema design.

- See TeganOar_A2-1/docs

15) Provide User stories for your App.

- The user stories are provided on the Trello Board

- See TeganOar_A2-1/docs

16) Provide Wireframes for your App.

- See TeganOar_A2-1/docs

	
17) Describe the way tasks are allocated and tracked in your project.

Usually, when working in a team on an project, we would have divided up tasks between the group. I did the assignment alone in this case so it wasn’t applicable. However, if I worked in a group, I would have done pair programming with the group members and worked with each team member on different days. I.e Three people were assigned to groups, so I would have pair programmed with a team member on one day, whilst the other team member did the documentation and then keep rotating this through the team, so everyone gets a chance to program in pairs and do documentation. 

18) Discuss how Agile methodology is being implemented in your project.

Once again, this differed from splitting up tasks between the team as I have worked on this assessment alone. However, I did split up features into sprints based on user stories and the project plan in the Trello board. Basically, I identified features that needed to be developed or priorotised based on user stories and allocated specific time frames for time management, based on how long I thought the features would take to develop, in order to manage my time appropriately. If the task was more complex and was taking more time than I had planned for, I would prioritise the importance of the feature and make a decision to either allocate more time to the feature, or put the feature on hold in the Trello board and make a decision at the end of project to either keep building it if I had enough time, or to drop the feature. 



19) Provide an overview and description of your Source control process.

Once again, as I worked on this assignment alone, the workflow differed from other teams. After creating the repository, I pushed it to Github as an initial commit. I committed small parts of each feature to my local repository, and after the feature was completed, or when I left my computer, I pushed it up to Github in order for it to be saved in the repository, in case something happened to the local drive. 

However, if I worked within a team, I would have set up a Github Account and then shared it with all the team members. The team would then create branches for each feature sprint that they worked on and once it was complete, the team member completing that feature would have pulled the master from Github to ensure what they were working on was up to date, and then merge this with the local master. Once this was done, they would push it back up to their Github, which would ensure that there was no conflicts. 


20) Provide an overview and description of your Testing process.


21) Discuss and analyse requirements related to information system security.

It is imperative to be absolutely transparent to the customers regarding how customer data is stored and used, which can be achieved through a Privacy Policy upon signup. Informing customers of any updates to the policy is also crucial and if there are any security breaches, customers must be informed immediately and in a manner that will alleviate their risk. As the application is deployed with Heroku and integrates with Stripe, a relationship with these vendors and having an oversight on these platforms is crucial to ensure if anything happens with these third party applications, that Made in China can also inform all of our customers directly. This is because even if it isn’t a security breach on our end, it will still reduce risk to our customers by advising them of the incident and also reduce churn to the company by not advising them.



22) Discuss methods you will use to protect information and data.

Users have full control over handling all of their data within the application, except for past purchases and past sales.
Require the minimum amount of user data to signup
Installed Devise, which is a gem authenticates and validates users.
Chose to use Stripe, which is a third party application for payment processing to ensure that clients security it encrypted, secured and adheres to all of the security legislation.
Privacy policy to ensure that no data is ever leaked to third parties
Data protection for Heroku is also also provided. This is through the following
Able to rollback if there is an issue with their database, 
Logical and physical backups that are stored in a backup system 
Sensitive data during transportation between user and server is protected as SSL is integrated. 



23) Research what your legal obligations are in relation to handling user data.

The software must have to adhere to the Australians Privacy Act, which is for private sector and not-for-profit organisations, which an annual turnover, over more than three million dollars. It dictates how entities must handle, manage and use personal information. 

These principles cover
- The open and transparent management of personal information including having a privacy policy
- An individual having the option of transacting anonymously or using a pseudonym where practicable
- The collection of solicited personal information and receipt of unsolicited personal information including giving notice about collection
- How personal information can be used and disclosed (including overseas)
- Maintaining the quality of personal information
- Keeping personal information secure
- Right for individuals to access and correct their personal information

However, as this application is going to be used in China, it would also need to adhere to their regulations. 

China’s privacy laws were updated in December 2012 to strengthen the protection of online information. This is because they  1.3 billion people, with over 40 percent of its population using the Internet., This new law is to governs businesses and organizations, including public institutions, that collect personal electronic information. As stated in the act - “Personal electronic information is defined as electronic information capable of identifying an individual or affecting personal privacy. 

The decision includes the following provisions:
- Organisations collecting personal electronic information must publish policies regarding their data practices.
- Individuals must be informed of the purpose, method, and scope of data collection.
- Organisations must obtain individuals’ consent prior to collecting personal electronic information.
- Organisations must implement measures to protect individuals’ personal electronic information against theft, loss, and damage.
- Organisations must refrain from selling or illegally disclosing personal electronic information.
- Organisations must take immediate remedial measures if personal electronic information is compromised.
- Organisations must refrain from sending commercial electronic communications to a recipient’s landline, - mobile phone, or email address without consent.










