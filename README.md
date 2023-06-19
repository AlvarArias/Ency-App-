<p align="center">
  <img src="https://github.com/AlvarArias/Ency-App-/assets/7523384/42a9a82a-9c74-415f-a7d4-603fba6f96ff" height="200">
  <h1 align="center">Ency App for iOS</h1>
</p>

This repository provides an overview of the key components of the Ency App project. 
Ency App is a powerful iOS application for Ipad, designed for creating sales proposals and seamlessly integrated with Zoho Books. 
The generated proposals are conveniently delivered to clients as PDF files. 
The app utilizes Core Data for efficient internal storage and is developed using Swift UI.

![EncyMainDiagram drawio](https://github.com/AlvarArias/Ency-App-/assets/7523384/28ae4459-262c-497e-8456-c1916467abf5)

## Introduction: 
Introducing Ency App, tool for sales agents to create business proposals with ease. 

Integrated with Zoho Books, this application generates "Draft Proposals" while accessing a comprehensive customer database of over 3,000 records, complete with full names and organization numbers. 

With Ency App, manipulate client-provided plans, generate new plans showcasing installed products, and incorporate crucial customer information, needs, and building details. 

Calculate energy savings effortlessly and save proposals as PDFs, offering convenient sharing via email or printing. 

<br>

## App User requirements
The user wants to have an app that fulfills the following functions:

- Data should update across all the screens of the app. For example, if the user modifies a measurement of the height of the building, they need to see these changes reflected in the energy calculation screens and the final proposal.
- A dynamic screen for energy calculation to help users in modeling different scenarios.
- A graphic interface to load PDF building plans, select a plane, add fans from the product list onto the plane, choose their position on the screen, and export an image of the new plane to attach it to the final proposal.  
- The UI element 'step-bar' is located at the bottom of the screen. It shows the customer the current step number for creating a proposal and allows them to navigate to different screens by selecting the corresponding step number.
- The new screens display columns with user information, a list of products, and add this information to the main view by clicking on the selected elements.
- Save the created proposal to Zoho Books, users platform for managing your accounting tasks and organizing your transactions.        
- The user need to has access to the customers database.
- The app needs to have a preview of the PDF document and then provide the option to export it.    
- The PDF file needs to be shareable with other apps (such as Gmail, a printer, etc).
- The proposal data needs to be saved on the memory device. 

<br>

## App screens

- [Customers View](https://github.com/AlvarArias/Ency-App-/blob/main/customers.md)
- [Construction Information](#construction-information-byggnad)
- [Customer problem information](#customer-problem-information-kunder-problem)
- [Graphic View](https://github.com/AlvarArias/Ency-App-/blob/main/graph.md)
- [Proposal generation](#proposal-generation)
- [Save Energy Calculation](#save-energy-calculation)
- [Proposals Preview](#proposals-preview)
- [Settings](#settings)

<br>

## App description
- [App overview](#app-overview)
- [Data integration, read and storage](#data-integration-read-and-storage)
- [Classes diagrams](https://github.com/AlvarArias/Ency-App-/blob/7de54ef5a0bbfc81d72dfe3c8d1d7775370517ae/Classes%20diagram.md)
- [Data arquitecture](#data-arquitecture)
- [Data patterns](#data-patterns)
- [External libraries](#external-libraries)
- [Testing App performance](#testing-app-performance)
- [Next steps](#next-steps)
- [Technical description](#technical-description)
  

<br>


## Construction Information (Byggnad)

This screen shows the information of the client's property, this must be completed by the executive.
Here the user registers the information of the client's property, filling in each one of the fields.

## Customer problem information (Kunder problem)

This screen shows the information of the client's problems, this must be completed by the executive.
Here the user registers the information of the problems of the property, filling each one of the fields.

![kundercopy](https://user-images.githubusercontent.com/7523384/211533677-f336f9af-285c-4f0f-a1c1-2a31447647c0.png)


## Proposal generation

### Products
This screen calculates the proposal that will be sent to the client, this must be confirmed by the executive and then it is saved. Contains 4 sections:

- Product List
- Proposal Cost
- Discount and notes 
- Proposal total

### Product List
Here the user selects the products that will be part of the costs of the proposal.

### Proposal Cost
Here the user views the complete list of products and obtains the subtotal of the proposal.

### Discount and notes 
Here the user can add to the proposal: a discount, terms, notes, hide the detailed list of the values ​​of each product and confirm the final value of the proposal.

### Proposal total
Here the user displays the total value (Subtotal - discount) of the proposal.

![productscopy](https://user-images.githubusercontent.com/7523384/211531394-49165872-8c8e-4df2-a25a-3efcf8882fc7.png)

## Save Energy Calculation
This screen calculates the proposal that will be sent to the client, this must be confirmed by the executive and then it is saved. Contains 3 sections:

- Building
- Calculation
- Economy 

![EnergyScreen copy](https://user-images.githubusercontent.com/7523384/211532887-c842126a-52cd-4089-a1cb-bbca5f313e44.png)

### Building
Here the user enters the information of the building that will be part of the calculation of energy savings of the proposal.

### Calculation
Here the user enters the energy consumption of the property and obtains the energy savings of the proposal.

### Economy 
Here the user visualizes the energy savings valued in Swedish kronor (SEK) and confirms the value of the proposal.

## Proposals Preview  
This screen shows a preview of the proposal to the user before sending it to the customer.
Contains 3 buttons:
- Save PDF
- Save energy
- Save to Zoho

<img src="https://github.com/AlvarArias/Ency-App-/assets/7523384/7dc34fad-fa98-4cd5-9306-943749d73e4d" alt="Settings" width="700">

PDF Preview

![Proposals](https://user-images.githubusercontent.com/7523384/211531442-0bd27f8e-d457-4745-907a-25b8426e8383.png)

Share proposal 

![SharePDF copy](https://user-images.githubusercontent.com/7523384/211531448-26eb5d0e-e792-4eb1-8ebb-5590b6c61f65.png)

## Settings
This screen displays the user's information and allows it to be edited on the form.
<img src="https://github.com/AlvarArias/Ency-App-/assets/7523384/3bb62496-4cad-4d1f-a290-cd67569b8232" alt="Settings" width="700">

## App overview
![Ency_Doc_Diagram2](https://github.com/AlvarArias/Ency-App-/assets/7523384/2123781b-820c-40e5-9b8d-399d8566ba09)

## Data integration, read and storage

### Integration:
The App seamlessly connects with Zoho and automatically generates proposals within Zoho Books. 
Each proposal is created as a new entry in the draft section of Zoho Books, ensuring a streamlined and organized workflow.
With this integration, users can effortlessly create and manage their proposals within the familiar environment of Zoho Books.

- The integration with Zoho Books is achieved through the use of REST API. 
This allows the App to securely communicate and exchange data with Zoho Books, enabling functionalities such as creating proposals, accessing customer records, and managing draft sections. 

- See Zoho Book API [here](https://www.zoho.com/books/api/v3/introduction/#organization-id). 
- Zoho REST APIs uses the OAuth 2.0 protocol to authorize and authenticate calls,more information [here](https://www.zoho.com/books/api/v3/oauth/#overview).


### Read Data

The application efficiently retrieves data from JSON format files, which are an integral part of the application. This functionality enables the display of a comprehensive list of customers and products, providing users with essential information.

### Record data

To ensure data security and backup, the application utilizes Core Data for recording essential information associated with each created proposal. These backup data are stored locally on the iPad, allowing users to retrieve and restore information as needed.

### Sharing data

With a user-friendly sharing module, the application facilitates easy sharing of proposals in PDF format. Users can seamlessly send the generated proposal files to various available applications on the device, including popular options like Gmail, Print, and Notes.

### Creation and read information of new users:

The application offers seamless creation and retrieval of information for new users. By leveraging Core Data, the app efficiently manages the process of reading and saving essential user details, ensuring a smooth experience and effective data management.

## Data arquitecture
This is the collection of data objects utilized within the app:

- @EnvironmentObject. 
An environment object is an observable object that can be accessed by any view within a view hierarchy. By making an object an environment object, you can easily share it with all of the views that need to access it.

```
    @EnvironmentObject var prospects: Prospects
```

- @StateObject.
A state object is a type of observable object that is owned by a single view. This means that it can only be accessed by that view and its child views.
```
 @State var usernameDate : Date = Date()
```

- @ObservableObject
Is a protocol that defines an object that can be observed. When the state of an observable object changes, it sends notifications to its observers. SwiftUI uses this concept to automatically update the UI when the state changes.

```
class Prospects: ObservableObject {
    @Published var people: [Prospect]
    .....

```

- @Binding.
A binding is a two-way connection between a property in one view and a property in another view.
```
  @Binding var newSelectedIndex: String
```


## Data patterns
- The use App the Singleton design pattern is a creational pattern that ensures only one instance of a class is created and provides global access to that instance. 
- In SwiftUI, you can implement the Singleton pattern using an ObservableObject.

### Example of the pattern used in the App: 

```
class SelectedProductSingleton : ObservableObject {
    static let shared = SelectedProductSingleton()
    @Published var name = ""
    @Published var description = ""
    @Published var rate : Double = 0.0
    @Published var quantity : Double = 0.0
    @Published var discount : Float = 0.0
    @Published var notes = ""
    @Published var terms = ""
    @Published var shippingCharge = ""
    
    private init() { }
}
```

By using the Singleton data pattern in SwiftUI, you can easily share and access a single instance of a class across different views and components in your app.

## External libraries
- TPPDF, is a fast PDF builder for iOS & macOS using simple commands to create advanced documents
- FilePicker, provides a `Button` that presents a platform-native file picker that is a modern way for use in SwiftUI.
  
## Testing App performance.
I leveraged Xcode Instruments to meticulously analyze the performance of the app, uncovering potential memory issues. Xcode Instruments is renowned for its exceptional capabilities as a powerful and versatile performance analysis and testing tool.

- Performance analysis
  
![Ency_test1](https://github.com/AlvarArias/Ency-App-/assets/7523384/8bd00570-5eaa-4087-b4fd-161ed67c973f)

- Memory issues
  
![Ency_test2](https://github.com/AlvarArias/Ency-App-/assets/7523384/7e19d885-2917-48eb-9416-2efdd7d46f9e)


## Next steps
In order to enhance the user experience, the upcoming stages of app development need to have a strong emphasis on simplifying the UI and optimizing app memory performance. To achieve these objectives, the following actions should be implemented:

- Develop a cross-platform application that caters to both iOS and macOS users, expanding its reach and usability.
  
- Transition the app into a Document-Based App model, streamlining file management for users and enhancing overall ease of use.
  
- Revamp the user interface, prioritizing simplicity and intuitiveness, to ensure a seamless and enjoyable user experience.
  
- Enhance the Drawing screen by updating the app to iOS 16 and utilizing native View to Image conversion, harnessing the latest iOS features for improved performance and functionality.
  
- Integrate the latest charts framework, now available for iOS 16, into the app to enhance its visual appeal and provide users with captivating and informative data visualization.
  
## Technical description

- Swift version: 5.5
- IOS version: 15.5
- Executable size: 105MB



