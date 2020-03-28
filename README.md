
Rocket Elevators API project.
==============================================
Team Leader : Mykee
Team Members :Agnes, Marouene, Sebastien

This App implements 7 APIs to a Ruby on Rails app.


1.Twilio API // Usage

    This Api will be triggered if the Status of an Elevator changes to
    'Intervention'.You'll get a text message on your phone.

    To use this one, first you need to go the Admin Section of
    the website http://rocketelevators.ca/admin. Now go to 'Navigation' on the
    left side panel and navigate to the 'Elevators' section. One in the elevators, select
    The elevator that you want to edit its status and click on it. Now you need to 
    go to 'Elevator Status' and change the status for 'Intervention'. Now click 'Save' at
    the bottom of the form and it'll send you a notification on your phone.


2.Slack API // Usage

    This Api will be triggered if the status of an Elevator changes, no matter
    what status it changes to, you will get a message on Slack with all the 
    information about the change that has been made.

    To use this one first you need to go to the Admin section of the website
    http://rocketelevators.ca/admin. Now go to 'Navigation' on the left side panel and navigate
    to the 'Elevators' section. One in the elevators, select the elevator that you want
    to edit its status and click on it. Now you need to go to 'Elevator Status' and change
    the status for any status you want. Now click 'Save' at the bottom of the form and it'll
    send you a message on Slack.


3.Zendesk API // Usage

    This Api will be triggered each time a Quote or a Lead is generated. It will make
    a 'Ticket' with all the information we need to get back to our customer on our
    Zendesk account for each lead and quote we receive.

    To Use it will to first login to our Zendesk account.
    https://rocketelevators5360.zendesk.com/agent/welcome. 
    
        - Username : mykee.o@icloud.com
        - Password : Mykee@123

    Next you'll need to navigate to rocketelevators.ca to generate either or 
    quote(http://rocketelevators.ca/pages/SubmissionForm.html) or a lead at the bottom
    of the home page. Now you just need to navigate to the Zendesk panel and your newly
    created form will be there as a ticket.


4.Sendgrid API // Usage

    This Api will be triggered if a contact completes the "Contact Us" form on the
    website http://rocketelevators.ca/. A transactional thank-you email will be sent
    to the email adress putted in the form.

    To use this one first you need to go to the website http://rocketelevators.ca/ 
    Now go to 'Contact Us' section on bottom of the page, or click on "Contact" in the
    nav-bar. Now just fill out the form using your email address.
    Now click 'Valider' at the bottom of the form and it'll send you a email. 


5.Dropbox API // Usage

    This Api will be triggered if a contact completes the "Contact Us" form with uploading 
    file on the website http://rocketelevators.ca/. An archiving procedure will be triggered.

    To use this one first you need to go to the website http://rocketelevators.ca/ 
    Now go to 'Contact Us' section on bottom of the page, or click on "Contact" in the nav-bar. 
    Now just fill out the form using your client name "Business Name" . 
    And upload a file using the upload button. Now click 'Valider' at the bottom of the
    form and it'll send you a email.Connect to the Rocket Elevators DropBox account with:

        E-mail: maamarmarouene@gmail.com
        Password: CodeBoxx2020

    On Dropbox left panel click on "Fichiers" to see all Customer Folders who uploaded files. 
    A new directory in DropBox on behalf of the client if the client does not already exist.
    You will find the uploaded file on the client DropBox directory.


6.IBM Watson API // Usage

    With IBM Watson Text to speech API you are able to listen a written summary 
    about the current state of the company.If the database is changing the summary
    is updating right away so you always get the right picture about your empire.
 
    To listen the summary, please sign in to the admin panel http://rocketelevators.ca/admin
    Then navigate to the Watson tab in the middle of the main page. Click the button 
    to refresh the file and then play with the audio button.



7.Google Maps API // Usage

    The Api is used to allow administrators of the Back-office to geolocate on
    a map every client’s buildings all across North America.

    To take a look at the map you need to go to the Admin section of the
    website http://rocketelevators.ca/admin. Then on the left side of the panel, the
    Geolocation button will bring you to the map.

    Every pointer seen on the map represent a building and by hovering on a pointer with 
    the mouse you can see the informations which are: address, number of floors, clients 
    name, number of batteries, number of columns, number of elevators and the technician’s full name.