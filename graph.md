
### 3.4 Drawings
This screen presents the building plan related to the proposal. Its main functionalities include:

- Loading PDF files with drawings
  
![SelectPDFok_AdobeExpress-2](https://github.com/AlvarArias/Ency-App-/assets/7523384/a1a32945-2234-4e4b-a2a9-c88bb824baa5)

[Vimeo](https://vimeo.com/836053068?share=copy)
  
- Editing and saving images
- Viewing customer information
- Adding products


### 3.4.1 Create Proposal Drawing 

- Setting factor: Generates a conversion factor to proportionally convert pixels on the view to measurements on the building plan.
- Adding products according to the flexible diameter and proportional placement on the building plan.

![SetFactor_AdobeExpress](https://github.com/AlvarArias/Ency-App-/assets/7523384/8aeb97c2-7642-43c4-9b31-ca91f1e7b7ff)

[Vimeo](https://vimeo.com/836076743?share=copy)

### 3.4.2 Customer information

- Customer information.

<img src="https://github.com/AlvarArias/Ency-App-/assets/7523384/1a8cb5d1-575c-47c6-b7da-927a6d0854de" alt="Customert info" height="400">
<br>

- Edit : Here the user can edit the building plan, must set the scale factor “Set factor”, can add a distance measurement, rotate and record the image.

<br>
<img src="https://github.com/AlvarArias/Ency-App-/assets/7523384/d2c0865b-cd05-4eff-8ad2-d0fdea71e46e" alt="Edit info" height="400">
<br>

- Add product : Here the user can add products to the building plan.
  
<br>
<img src="https://github.com/AlvarArias/Ency-App-/assets/7523384/971ce8ba-4611-424b-812c-85915b481203" alt="Add product" height="400">  
<br>

### Views diagrams:

![DiagramView](https://github.com/AlvarArias/Ency-App-/assets/7523384/bbba7bcc-b251-4c13-980e-4bc0813cb9d4)

### Classes diagrams

#### Geometry View
![GeometryView](https://github.com/AlvarArias/Ency-App-/assets/7523384/aca2d861-b5b3-40dc-975c-896b56f717f8)

```
struct GeometryView: View {
    
    //MARK: @Binding State
    @State private var data = false
 
    // MARK: State
    @State private var showingProduct = false
    @State private var showingEdit = false
    @State private var showingInfo = false
    @State private var showButtonBar = false

    var body: some View {
        GeometryReader { geometry in
            
            ZStack (alignment: .trailing) {
        
                myBackgroundView(isPdfSelected: $data, viewModel: modelView() )

```


#### BackgroundView
![BackgroundView](https://github.com/AlvarArias/Ency-App-/assets/7523384/86a3025b-afe3-41ce-a259-6fa61a26f51c)

```
struct myBackgroundView: View {

    // MARK: Env Object
    @EnvironmentObject var prospects: Prospects
    
    
    // MARK: Singeltons
    @StateObject var myEditSetting = EditSingleton.shared
    @StateObject var drawSettings = DrawingUserSettings()
    @StateObject var theFactor = FactorSingleton.shared
    
    // MARK: Zoom gesture
    @GestureState var magnifyBy = 1.0
    
    // MARK: Binding Variables
    @Binding var isPdfSelected: Bool
    
    // MARK: State variables
    // Graphics
    @State private var imageScaleAmount = 0.0
    // PDF
    @State private var urlOfPdf = Bundle.main.url(forResource: "test1", withExtension: "pdf")!
    @State private var isPdfLoad = false
    @State private var presentimporter = false
    @State private var pdfFileName = "Example3.jpg"
    @State private var savePdfToIpadStorage = false
    @State private var selectedPage = "1"
    @State private var isPageSelected = false
    @State private var maxPages = 1
    @State private var showPDFKit = true
    @State private var showPDFScroll = false
    @State private var isCleanCircle = true
    
   
    // MARK: Local variables
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!}
    
    // Save image
    @State private var pdfImage: Data?
    
    // Save Img to user defaults
    @State private var distanceViewImage: UIImage? // Image variable
    
    // View modell
    @ObservedObject var viewModel: modelView
    
```

