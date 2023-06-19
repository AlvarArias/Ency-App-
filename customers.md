## Custormers View
This screen shows the customer information.
It contains 3 important sections:

- Customer Information Form
- BD customer information
- New Customers(Core Data)

![1 Customer2](https://github.com/markrenaud/FilePicker/assets/7523384/2b10e700-8496-4b28-9f15-db1bc509b2b7)

### Form customer information
- Form customer information allows customers to input key details: 
- prospect's name, project name, company name, customer ID, organization number, and comprehensive contact person information.

### BD Customer information
- BD Customer information in Ency app presents a list of 3000 companies. 
- Clicking on an item binds its data to the Form customer information. 
- Use the search bar to find companies by name. 
- The database is a modified JSON file extracted from customer CRM.

### New Customers
![NewCustomersPage](https://github.com/AlvarArias/Ency-App-/assets/7523384/11feae19-b98e-4ba2-927b-e5a71a70cca0)

- To create a new customer, fill mandatory information and click the + button. 
- Core Data creates a new customer record, allowing users to save and reuse details for proposals. 
- Clicking on a list item binds its data to the Form customer information.

### Here is the Core data Model:
![Entity](https://github.com/AlvarArias/Ency-App-/assets/7523384/be9fbdeb-4517-464c-b08d-8b33883312d8)


### Here is code for the View "Add New Customer" :

```
struct CoreCustomerView: View {
    
    // Binding variables
    @Binding var newSelectedIndex: String
    @Binding var newSelectedCustomer: String
    @Binding var newOrgNumCustomer: String
    
    @Environment(\.managedObjectContext) var mylist
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.customer_name, order: .reverse)
    ]
    ) var products: FetchedResults<EncyEstimate>
    
    
    var body: some View {
   
            VStack {
            
                List {
                Text("Nya Kunder")
            ForEach(products) { kunder in
                VStack(alignment: .leading) {
                Text(kunder.customer_name ?? "Kunder Namn")
                Text(kunder.customer_id ?? "Kunder ID")
                Text(kunder.customer_org_num ?? "Kunder Org Num")
                }.onTapGesture{
                    print("On Tap")
                    newSelectedIndex = kunder.customer_name ?? "Kunder Namn"
                    newSelectedCustomer = kunder.customer_id ?? "Kunder ID"
                    newOrgNumCustomer = kunder.customer_org_num ?? "Kunder Org Num"
                    }
                
                    }
            .onDelete(perform: removeLanguages)
                    
                }
   
               EditButton()
            }
    
    }
    
    func removeLanguages(at offsets: IndexSet) {
        for index in offsets {
            let producto = products[index]
            mylist.delete(producto)
        }
        do {
            try mylist.save()
        } catch {
            print("error to save object")
        }
    }
    
}
```
