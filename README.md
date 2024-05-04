# Big Rapid Drycleaning & Tux Website 

Live Site URL: https://drycleaner.servesarcasm.com/
 - Admin Credentials
 	- test@contoso.com
 	- test

## Summary
BRDrycleaners is your one-stop solution to your laundry routine. Our user-friendly website is designed to make the laundry process easier, making it more convenient for customers. Whether you're a busy professional or someone who prefers the ease of online scheduling, BRDrycleaners has you covered.

Features:
	
• Online Appointment Scheduling: Schedule your laundry appointments hassle-free, anytime, anywhere.

• Pick-Up and Drop-Off: Arrange pick-up and drop-off times that suit your schedule.

• Hours of Operation: Easily access our hours of operation to plan your visit.

• Promotions: Able to see current or upcoming promotions.

• Location: Able to see the physical location(s) of the BRDrycleaners.

• Pricing: Ability to see the cost of a specific service.

• Account: Customers are able to make an account and sign in to an account in order to make their experience more user oriented and simple.

Target Audience:
Our target audience includes individuals who rely on laundry services, including busy professionals and older adults who seek convenience and simplicity in their daily tasks.

User-Friendly Design:
Our website boasts a simple and intuitive design, ensuring that even those unfamiliar with online platforms can navigate effortlessly and find the services they need.

## Client Asks
1. Top Priorities:
Our main aim is to ensure the website works well for customers to use our services. We want all the things listed in the document to be on the website.

2. Feature Performance:
If some parts of the website slow things down, like big pictures or videos, we're okay with cutting them down or leaving them out. We don't expect problems with how much data the website uses, but it's important that it works smoothly.

3. Technical Ability of Users:
The people using the website won't know much about tech stuff. So, we'll need clear guides to help them understand how everything works.

4. Information Acquisition:
We've already given you info about our services, prices, and where we are.

5. Website Theme and Design:
We want the website to look serious and professional, not playful. We have colors picked and we want it to look good.

## Glossary
Glossary  
CRUD: Acronym for Create, Update and Delete 
## Solution Breakdown
### Overview 

The BRDryCleaning system is designed to facilitate the operation of a drycleaning laundromat and tuxedo renting business. It provides a comprehensive assortment of features for both users and administrators. Features enabling efficient management of appointments, orders, promotions, meetings, payments, and customer accounts. 

### Architecture 
The solution is structured into three primary segments: 

### User Interface (UI): 
The UI component is responsible for presenting information to users and capturing their inputs. 
Built using HTML and C#, it offers an intuitive interface for users to interact with the system. 
Users can create accounts, schedule appointments, view discounts, promotions, and place orders through this interface. 

### DataHooks and 27 Objects: 
The DataHooks class serves as the controller between the UI and the database. 
When users interact with the UI, inputs are passed to the DataHooks Objects. 
These objects encapsulate the logic for processing user inputs and translating them into actions that interact with the database. 

### Database: 
The database component stores all relevant data for the system. 
Developed using MySQL, it serves as the backend storage for objects held within the system. 
The DataHooks Objects communicate with the database to perform operations such as creating orders, updating user accounts, setting prices, and applying discounts or promotions. 

### Functionality 
User Features: 
Users can create accounts, schedule appointments, view available discounts/ promotions, earn loyalty points, view current orders, schedule pick-ups and drop offs. 
Loyalty points are earned with each order, contributing to customer retention and engagement. 

### Admin Features: 
Program owners or administrators have access to additional functionalities. 
They can set prices, manage orders, configure discounts, create promotions, edit meetings, and business information/locations to drive business growth and customer satisfaction. 

### Integration 
The seamless integration of the UI, DataHooks Objects, and the database ensures smooth operation and efficient data flow throughout the system. 
User interactions are handled transparently, with inputs processed and persisted in the database seamlessly. 
Updates to pricing, discounts, and promotions are reflected in real-time across the UI, providing users with up-to-date information. 

![Capture3](https://github.com/briekellis/BigRapidsDrycleaning/assets/145706583/0659c2c4-c9a8-432d-b5ac-5de20970a4e8)
![Capture4](https://github.com/briekellis/BigRapidsDrycleaning/assets/145706583/b7d2c0d7-a0c8-439c-a2c8-1bf33d06511a)
![Capture5](https://github.com/briekellis/BigRapidsDrycleaning/assets/145706583/6fe3d4aa-d4a5-462d-b32a-af4692491624)
![mvc example drawio](https://github.com/briekellis/BigRapidsDrycleaning/assets/145706583/46a601e7-a04d-4c1a-89a3-58e0f20a9f1c)

## Testing Breakdown
Testing Philosophy:  
Our testing approach followed a Arrange, Act and Assert pattern. 
Arrange 
As a ... 
This step is setting necessary data into the required object for the testing environment. 

Act  
	I expect ... 
	This step invokes the method being tested using the arranged input. 

Assert 
	So that ... 
	This step sets what the outcome should be then verifies the method outcome with what is expected.  

   
**Example of Test from Code:**
```csharp
// Fact
public void CustomerLoginVerifier_WhenLoggingInWithUnregisteredCustomer_ThenFailPasswordVerification()
{
    // Arrange
    var testPassword = $"NewPassword1x_$#";
    var saltFromDatabase = PasswordHasher.BuildRandomSalt();
    var passHash = PasswordHasher.SlowHash(testPassword, saltFromDatabase);

    var customerLoggingIn = new Customer()
    {
        FirstName = "Test",
        LastName = "Test",
        PasswordHash = passHash.ToString(),
    };

    var dataHooks = Substitute.For<IDataHooks>();
    dataHooks.GetAllCustomerAccounts().Returns(new List<Customer>()); // Assuming you meant to return a list here
    CustomerLoginVerifier.Instance.InjectDataProvider(dataHooks, true);

    // Act
    var customerConfirmedMatch = CustomerLoginVerifier.Instance.Login(customerLoggingIn, testPassword);

    // Assert
    customerConfirmedMatch.Should().BeFalse();
}
```

These tests are based on logic needed for the application. The philosophy was to not test the .NET platform, and to not test code we didn't write. UI also did not require automated testing at this scope. Because of the lack of automated UI testing, we ran regression testing at the 95% complete mark, verifying that changes didn't negatively affect the system as a whole. 
<img width="603" alt="unit-and-spec-tests" src="https://github.com/briekellis/BigRapidsDrycleaning/assets/156151344/c44a4b28-0c87-42df-9036-cad160f5089e">


#### Final Schema Diagram
The database schema evolved over time, the final schema appears as follows.
![BRD-Schema-DBML](https://github.com/briekellis/BigRapidsDrycleaning/assets/156151344/f0587d2b-5b09-4a93-93d0-5f0c24a43e86)

This schema requires MS SQL. Once installed, the database and its data can be generated using the ```BRD-Database-Creation-Script.sql``` file in the root of this repo.

#### Setup
Once the database is stood up, follow the standard IIS installation flow published by Microsoft: https://learn.microsoft.com/en-us/iis/application-frameworks/scenario-build-an-aspnet-website-on-iis/configuring-step-1-install-iis-and-asp-net-modules

##Authors
- Brie Ellis
- Dan Sokol
- Hawke Harrington
- Megan Lesch
- Steven Starlin



