
![newENCY](https://github.com/AlvarArias/Ency-App-/assets/7523384/42a9a82a-9c74-415f-a7d4-603fba6f96ff)
# Ency-App
This repository provides an overview of the key components of the Ency App project. 
Ency App is a powerful iOS application designed for creating sales proposals and seamlessly integrated with Zoho Books. 
The generated proposals are conveniently delivered to clients as PDF files. 
The app utilizes Core Data for efficient internal storage and is developed using Swift UI.

![EncyMainDiagram drawio](https://github.com/AlvarArias/Ency-App-/assets/7523384/28ae4459-262c-497e-8456-c1916467abf5)

## 1. Introduction: 
Introducing Ency App, tool for sales agents to create business proposals with ease. 

Integrated with Zoho Books, this application generates "Draft Proposals" while accessing a comprehensive customer database of over 3,000 records, complete with full names and organization numbers. 

With Ency App, manipulate client-provided plans, generate new plans showcasing installed products, and incorporate crucial customer information, needs, and building details. 

Calculate energy savings effortlessly and save proposals as PDFs, offering convenient sharing via email or printing. 


## 2. Data integration, read and storage:

### 2.1 Integration:

The integration to Zoho Books is done in 2 steps:

- In the first step, the App sends the proposal information to Zapier via hooks through a POST call.
- In the second step Zapier connects with Zoho and creates the proposal in Books, creating a new proposal in the draft.

### 2.2 Read Data

The application reads data from JSON format files (these are part of the application), to show the complete list of customers and the list of products.

### 2.3 Record data

The application records backup data for each proposal created, using Core Data,
These data are recorded on the iPad.

### 2.4 Sharing data

The application shares data of the proposal created in PDF file, using a module that allows you to send this file to other applications available in the app, for example: gmail, Print, Notes.

### 2.5 Read data from Google Sheets:

To read data in Google Sheets , the app makes a GET API call to the servicehttps://sheetson.com and this is connected to the Google Sheets spreadsheet with the information of the new users.


## App preview

<img src="https://user-images.githubusercontent.com/7523384/211507440-8059a93c-cf56-4b0d-8d16-dac62d3479f3.png" alt="drawing" width="400"/>

3 Application screens:

## Customer Information

### 3.1 Customers
This screen shows the customer information that is going to be completed by the executive.

It contains 3 important sections: 

- Customer Information Form
- BD customer information 
- New Customers(from Google Sheets)

![1 Customer copy](https://user-images.githubusercontent.com/7523384/211534375-353a4a6f-86d5-4925-bc22-168974ab6251.png)

### 3.2 Construction Information (Byggnad)

This screen shows the information of the client's property, this must be completed by the executive.
Here the user registers the information of the client's property, filling in each one of the fields.

### 3.3 Customer problem information (Kunder problem)

This screen shows the information of the client's problems, this must be completed by the executive.
Here the user registers the information of the problems of the property, filling each one of the fields.

![kundercopy](https://user-images.githubusercontent.com/7523384/211533677-f336f9af-285c-4f0f-a1c1-2a31447647c0.png)


## Graphic component

### 3.4 Drawings
This screen displays the plan of the building associated with the proposal, allows you to add products, edit and save the image, and view customer information.

### 3.4.1 Drawing
Here the user can see the plan of the building that will be part of the proposal.

### 3.4.2 Customer information
- Customer information.
- Edit : Here the user can edit the building plan, must set the scale factor “Set factor”, can add a distance measurement, rotate and record the image.
- Add product : Here the user can add products to the building plan.

![Set Factor copy](https://user-images.githubusercontent.com/7523384/211532014-88fea545-8908-499a-a266-8f85aaa0b494.png)

## Proposal generation

### 3.5 Products
This screen calculates the proposal that will be sent to the client, this must be confirmed by the executive and then it is saved. Contains 4 sections:

- Product List
- Proposal Cost
- Discount and notes 
- Proposal total

### 3.5.1 Product List
Here the user selects the products that will be part of the costs of the proposal.

### 3.5.2 Proposal Cost
Here the user views the complete list of products and obtains the subtotal of the proposal.

### 3.5.3 Discount and notes 
Here the user can add to the proposal: a discount, terms, notes, hide the detailed list of the values ​​of each product and confirm the final value of the proposal.

### 3.5.4 Proposal total
Here the user displays the total value (Subtotal - discount) of the proposal.

![productscopy](https://user-images.githubusercontent.com/7523384/211531394-49165872-8c8e-4df2-a25a-3efcf8882fc7.png)

### 3.6 Save Energy Calculation
This screen calculates the proposal that will be sent to the client, this must be confirmed by the executive and then it is saved. Contains 3 sections:

- Building
- Calculation
- Economy 

![EnergyScreen copy](https://user-images.githubusercontent.com/7523384/211532887-c842126a-52cd-4089-a1cb-bbca5f313e44.png)

### 3.6.1 Building
Here the user enters the information of the building that will be part of the calculation of energy savings of the proposal.

### 3.6.2 Calculation
Here the user enters the energy consumption of the property and obtains the energy savings of the proposal.

### 3.6.3 Economy 
Here the user visualizes the energy savings valued in Swedish kronor (SEK) and confirms the value of the proposal.

### 3.7 Save Energy Calculation
This screen shows the user the proposal that will be sent to the client (Scroll the document). Contains 3 buttons:

- Save PDF
- Save energy
- Save to Zoho 

![PDF Preview copy](https://user-images.githubusercontent.com/7523384/211531442-0bd27f8e-d457-4745-907a-25b8426e8383.png)

Share proposal 

![SharePDF copy](https://user-images.githubusercontent.com/7523384/211531448-26eb5d0e-e792-4eb1-8ebb-5590b6c61f65.png)

### 3.8 Settings
This screen displays the user's information and allows it to be edited on the form.










