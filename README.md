# 🏆 Sports Database Management System

A comprehensive Java-based Sports Database Management System implementing various **Data Structures and Algorithms** for efficient player and staff management.

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![DSA](https://img.shields.io/badge/DSA-Algorithms-blue?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

## 📋 Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Data Structures & Algorithms](#data-structures--algorithms)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [How It Works](#how-it-works)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

This project demonstrates practical implementation of fundamental Data Structures and Algorithms concepts through a real-world sports team management system. It efficiently manages a football team's database with 32+ players and staff members, providing fast search capabilities and hierarchical organization.

### Key Highlights
- ⚡ **O(log n) Binary Search** for instant player lookup
- 🌳 **Tree-based hierarchical organization** of roles and positions
- 🔐 **Polynomial hashing** for unique ID generation
- 📊 **Efficient sorting** using Merge Sort and Radix Sort
- 🎨 **GUI interface** using Java Swing

## ✨ Features

### 1. **Quick Search**
- Search any player or staff member by name
- Case-insensitive search
- Displays complete details: ID, Name, Age, Role, Position

### 2. **Hierarchical Organization**
- View complete organizational tree structure
- Navigate by roles (Staff/Player)
- Filter by positions (Coach, Manager, Defender, Midfielder, etc.)

### 3. **Efficient Data Management**
- Automatic sorting and indexing
- Hash-based unique ID generation
- Queue implementation using two stacks

## 🛠️ Data Structures & Algorithms

### Data Structures Used
| Structure | Purpose | Complexity |
|-----------|---------|------------|
| **Array** | Sequential storage of records | O(1) access |
| **Stack** | LIFO operations for queue | O(1) push/pop |
| **Queue** | FIFO data management | O(1) enqueue |
| **Tree** | Hierarchical organization | O(h) search |
| **Hash Table** | Unique ID generation | O(n) hashing |

### Algorithms Implemented
| Algorithm | Time Complexity | Use Case |
|-----------|----------------|----------|
| **Binary Search** | O(log n) | Fast player lookup |
| **Merge Sort** | O(n log n) | Sorting records |
| **Radix Sort** | O(d×n) | Multi-dimensional sorting |
| **Hashing** | O(n) | ID generation |
| **Tree Traversal** | O(n) | Display hierarchy |

## 📥 Installation

### Prerequisites
- **Java JDK 8+** installed
- **Git** (optional, for cloning)

### Quick Start

#### Windows:
```bash
# Clone the repository
git clone https://github.com/ranaawais30/Sports-Database-Management-System.git
cd Sports-Database-Management-System

# Run the application
run.bat
```

#### Linux/Mac:
```bash
# Clone the repository
git clone https://github.com/ranaawais30/Sports-Database-Management-System.git
cd Sports-Database-Management-System

# Make script executable
chmod +x run.sh

# Run the application
./run.sh
```

#### Manual Execution:
```bash
# Copy data file
cp data.csv Code/

# Compile
javac Code/dsa.java

# Run
java Code.dsa
```

## 🎮 Usage

### Option 1: Search by Name
1. Run the application
2. Select **Option 1**
3. Enter player/staff name (e.g., `ibrahim`, `fatima`, `hassan`)
4. View complete details

**Example:**
```
Input: ahmed
Output:
  ID: 1113037
  Name: Ahmed
  Age: 38
  Role: Staff
  Position: Assistant Manager
```

### Option 2: View Organizational Tree
1. Run the application
2. Select **Option 2**
3. View complete hierarchy
4. Search by role/position (e.g., `midfielder`, `coach`, `staff`)
5. See all members in that category

**Example Tree Structure:**
```
Football
├── Staff
│   ├── Coach
│   │   ├── Ibrahim
│   │   ├── Usman
│   │   └── Ali
│   ├── Assistant Manager
│   │   ├── Tariq
│   │   └── Ahmed
│   └── Manager
│       ├── Tahir
│       └── Farhan
└── Player
    ├── Defender
    │   ├── Hassan
    │   └── Amir
    ├── Forward
    │   ├── Bilal
    │   └── Samir
    ├── Keeper
    │   ├── Danish
    │   └── Jameel
    └── Midfielder
        ├── Faisal
        └── Zainab
```

## 📁 Project Structure

```
Sports-Database-Management-System/
├── Code/
│   └── dsa.java          # Main Java source code
├── data.csv              # Sports database (32 records)
├── run.bat               # Windows execution script
├── run.sh                # Linux/Mac execution script
├── README.md             # Project documentation
└── LICENSE               # MIT License
```

## 🔍 How It Works

### 1. Data Loading
```
data.csv → Parse CSV → Create Record Objects → Generate Hash IDs → Store in Queue
```

### 2. Search Operation
```
User Input → Hash Name → Sort Records (Radix + Merge) → Binary Search → Display Result
```

### 3. Tree Organization
```
CSV Data → Build Tree Structure → Traverse Tree → Search by Role → Display Members
```

### 4. Hashing Function
```java
hash("ahmed") = 10^0×'a' + 10^1×'h' + 10^2×'m' + 10^3×'e' + 10^4×'d'
              = 1113037 (unique ID)
```

## 📊 Database Schema

**CSV Format:** `name,age,position,role`

**Sample Data:**
```csv
ibrahim,25,coach,staff
hassan,42,defender,player
fatima,38,coach,staff
faisal,31,midfielder,player
```

**Total Records:** 32 (16 staff, 16 players)

## 🎓 Educational Value

This project demonstrates:
- ✅ Practical DSA implementation
- ✅ Algorithm complexity analysis
- ✅ Data structure selection trade-offs
- ✅ Java programming best practices
- ✅ GUI development with Swing
- ✅ File I/O operations
- ✅ Object-oriented design

## 🚀 Performance

| Operation | Time Complexity | Records | Comparisons |
|-----------|----------------|---------|-------------|
| Search | O(log n) | 32 | Max 5 |
| Search | O(log n) | 1000 | Max 10 |
| Sort | O(n log n) | 32 | ~160 |
| Tree Build | O(n) | 32 | 32 |

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Ideas for Contribution
- Add database persistence (save changes back to CSV)
- Implement UPDATE and DELETE operations
- Create a rich GUI using JavaFX
- Add data validation and error handling
- Implement multi-threading for large datasets
- Add unit tests
- Create a web interface

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Rana Awais**
- GitHub: [@ranaawais30](https://github.com/ranaawais30)
- Email: rranaawais517@gmail.com

## 🙏 Acknowledgments

- Inspired by real-world sports management systems
- Built as a Data Structures and Algorithms academic project
- Thanks to the open-source community for inspiration

## 📞 Support

If you have any questions or need help, please:
- Open an issue on GitHub
- Contact via email
- Check the documentation

---

⭐ **Star this repository if you found it helpful!**

Made with ❤️ by Rana Awais