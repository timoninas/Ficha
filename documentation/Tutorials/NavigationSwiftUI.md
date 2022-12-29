# Navigation in SwiftUI


## `.navigation`

```Swift

var content: ContentItem?

var body: some View {
    VStack {
        Text("123")
    }
    .navigation(item: $content) { item in
        DetailsView(item: item)
    }
}
```

## `.confirmationDialog`

```Swift

@State
var isSheetShowing = false

var body: some View {
  NavigationView {
      VStack {
      }
      .confirmationDialog("Do you want to delete all items?", isPresented: $isSheetShowing) {
            Button {
                print("Clicked cancel")
            } label: {
                Text("Don't delete")
            }
            Button("Yes, delete all", role: .destructive) { print("Clicked confirmation") }
      }
  }
}

```
