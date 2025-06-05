# ViperExample — ToDo List App

An example iOS application built using **VIPER architecture**, with support for **dependency injection (DIContainer)**, **UserDefaults-based storage**, and **XIB-based UI layout**.

---

## 🧱 Architecture

The project is organized using the VIPER pattern and divided into modules:

- **View** — ToDoListViewController.xib, ToDoListViewController.swift
- **Presenter** — ToDoListPresenter
- **Interactor** — ToDoListInteractor (uses TaskManager resolved from DI)
- **Entity** — ToDoListEntity.swift (includes the Task model)
- **Router** — ToDoListRouter (navigation and alerts)
- **Assembly** — ToDoListAssembly wires up all dependencies of the module
- **DI** — DIContainer and AppDependencies for registering and resolving services
- **Storage** — TaskManager and UserDefaultsTaskStorage implementations using the TaskStorable abstraction

---

## 📁 Project Structure

```
ViperExample/
├── Source/
│   ├── AppHelper/
│   │   └── AppDelegate.swift
│   ├── Flow/
│   │   └── ToDoList/
│   │       ├── View/
│   │       │   ├── ToDoListViewController.swift
│   │       │   └── ToDoListViewController.xib
│   │       ├── Presenter/
│   │       │   └── ToDoListPresenter.swift
│   │       ├── Interactor/
│   │       │   └── ToDoListInteractor.swift
│   │       ├── Router/
│   │       │   └── ToDoListRouter.swift
│   │       ├── Entity/
│   │       │   └── ToDoListEntity.swift
│   │       └── Assembly/
│   │           └── ToDoListAssembly.swift
│
├── Resource/
│   ├── DI/
│   │   ├── AppDependencies.swift
│   │   └── DIContainer.swift
│   └── Storage/
│       ├── TaskManager.swift
│       └── UserDefaultsTaskStorage.swift
│
├── SupportedFiles/
│   ├── Info.plist
│   ├── LaunchScreen.storyboard (if used)
│   └── Assets.xcassets
```

---

## 🚀 How to Run

1. Open `ViperExample.xcodeproj` in Xcode.
2. Ensure that the root view controller is created from DI in `AppDelegate.swift`:
   ```swift
   let rootVC = dependencies.makeToDoListModule()
   ```
3. In `Info.plist`:
   - ❌ Remove `UIMainStoryboardFile` if it exists
   - ✅ Make sure `UILaunchStoryboardName` is empty or removed
4. Build and run the app using `Cmd + R`.

---

## ✅ Features

- Add and display tasks
- Persist task state using `UserDefaults`
- Abstract storage layer via `TaskStorable`
- Flexible dependency injection (DIContainer) with replaceable TaskManager
- Fully protocol-oriented and testable architecture

---

## 🧪 Future Improvements

- [ ] Replace `UserDefaults` with `CoreData`
- [ ] Add unit tests for Interactor and Presenter
- [ ] Support for multi-module or multi-scene architecture

---

## 📄 Author

Project by Kostiantyn Antoniuk (2025)

License: MIT
