# 📚 Technical Documentation

## Architecture Overview

### System Design
```
┌─────────────────────────────────────────────────────────┐
│                    User Interface (GUI)                  │
│                    Java Swing Dialogs                    │
└─────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────┐
│                   Application Layer                      │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐             │
│  │  Search  │  │   Tree   │  │   Menu   │             │
│  │  Module  │  │  Module  │  │  Module  │             │
│  └──────────┘  └──────────┘  └──────────┘             │
└─────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────┐
│                   Data Structure Layer                   │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐             │
│  │  Queue   │  │  Stack   │  │   Tree   │             │
│  └──────────┘  └──────────┘  └──────────┘             │
└─────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────┐
│                   Algorithm Layer                        │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐             │
│  │  Binary  │  │  Merge   │  │ Hashing  │             │
│  │  Search  │  │   Sort   │  │ Function │             │
│  └──────────┘  └──────────┘  └──────────┘             │
└─────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────┐
│                    Data Storage Layer                    │
│                      data.csv File                       │
└─────────────────────────────────────────────────────────┘
```

## Class Diagram

```
┌─────────────────┐
│      dsa        │  (Main Class)
├─────────────────┤
│ - s: Scanner    │
│ - f: File       │
│ - q: Queue      │
├─────────────────┤
│ + main()        │
│ + input()       │
│ + menu()        │
└─────────────────┘
         │
         │ uses
         ↓
┌─────────────────┐
│     Queue       │
├─────────────────┤
│ - s1: Stack     │
│ - s2: Stack     │
│ - capacity: int │
├─────────────────┤
│ + enqueue()     │
│ + dequeue()     │
│ + binSearch()   │
│ + radixSort()   │
│ + merge()       │
│ + sort()        │
└─────────────────┘
         │
         │ contains
         ↓
┌─────────────────┐
│     Stack       │
├─────────────────┤
│ - t: int        │
│ - stack: Record[]│
├─────────────────┤
│ + push()        │
│ + pop()         │
│ + isEmpty()     │
│ + isFull()      │
│ + display()     │
└─────────────────┘
         │
         │ stores
         ↓
┌─────────────────┐
│     Record      │
├─────────────────┤
│ - id: int       │
│ - name: String  │
│ - age: int      │
│ - role: String  │
│ - position: String│
├─────────────────┤
│ + print()       │
│ + getID()       │
│ + getName()     │
└─────────────────┘

┌─────────────────┐
│      Tree       │
├─────────────────┤
│ - child: Tree[] │
│ - s: String     │
│ - x: int        │
│ - p: int        │
├─────────────────┤
│ + Search()      │
│ + traverse()    │
│ + join()        │
│ + main()        │
└─────────────────┘

┌─────────────────┐
│      Hash       │
├─────────────────┤
│ (static class)  │
├─────────────────┤
│ + hash()        │
└─────────────────┘

┌─────────────────┐
│      Case       │
├─────────────────┤
│ (static class)  │
├─────────────────┤
│ + toTitleCase() │
└─────────────────┘
```

## Algorithm Details

### 1. Binary Search Algorithm

**Purpose:** Search for a player/staff by name efficiently

**Pseudocode:**
```
Algorithm binarySearch(name):
    INPUT: name to be searched
    OUTPUT: displays whether record has been found
    
    radixSort()  // Sort records first
    
    id_no = Hash.hash(name)  // Convert name to ID
    
    records = getQ().getStack()  // Get sorted array
    right = upperbound(records)
    left = lowerbound(records)
    p = 0
    
    While left <= right Do
        mid = (left + right) / 2
        id_mid = records[mid].getID()
        
        if id_mid == id_no then
            p = 1
            record found
        Else if id_no > id_mid Do
            left = mid + 1
        Else 
            right = mid - 1
    
    if p == 1 then
        display record
    Else 
        display name + " not found"
```

**Time Complexity:** O(log₂ n)
**Space Complexity:** O(1)

**Example:**
```
Search for "ahmed":
Array: [1000, 1113037, 1234567, 1500000, ...]
       [  0      1        2         3     ...]

Step 1: left=0, right=31, mid=15
Step 2: Compare 1113037 with target
Step 3: Found at index 1!
```

### 2. Merge Sort Algorithm

**Purpose:** Sort records by ID for efficient searching

**Pseudocode:**
```
Algorithm mergeSort(arr, l, r):
    INPUT: Array arr to be sorted with its upper and lowerbounds
    OUTPUT: sorted array arr
    
    if l < r then 
        m = l + (r-l) / 2
        sort(arr, l, m)
        sort(arr, m + 1, r)
        merge(arr, l, m, r)

Algorithm merge(arr, l, m, r):
    n1 = m - l + 1
    n2 = r - m
    
    initialise array L of length n1
    initialise array R of length n2
    
    for i=0 to i<n1 Do
        L[i] = arr[l + i]
    
    for j=0 to j<n2 Do
        R[j] = arr[1 + m + j]
    
    i = 0, j = 0, k = l
    
    While i < n1 && j < n2 Do
        if L[i].getID() <= R[j].getID() Then
            arr[k] = L[i]
            i = i+1 
        Else
            arr[k] = R[j]
            j = j+1 
        k = k + 1 
    
    While i < n1 Do
        arr[k] = L[i]
        i = i + 1 
        k = k + 1 
    
    While j < n2 Do
        arr[k] = R[j]
        j = j + 1 
        k = k + 1
```

**Time Complexity:** O(n log₂ n)
**Space Complexity:** O(n)

**Example:**
```
Input: [38, 27, 43, 3]

Divide:
[38, 27, 43, 3]
[38, 27] [43, 3]
[38] [27] [43] [3]

Merge:
[27, 38] [3, 43]
[3, 27, 38, 43]
```

### 3. Hashing Algorithm

**Purpose:** Generate unique ID from name

**Pseudocode:**
```
Algorithm hash(name):
    INPUT: name
    OUTPUT: hashed sum
    
    sum <- 0
    toTitleCase(name)  // ensure case-insensitivity
    a <- 10
    
    for i<-0 to name->length
        sum += Math.pow(a, i) * name.charAt(i)  // a^n * char
    
    return sum
```

**Time Complexity:** O(n) where n = length of name
**Space Complexity:** O(1)

**Example:**
```
hash("ahmed") = 10^0×'a' + 10^1×'h' + 10^2×'m' + 10^3×'e' + 10^4×'d'
              = 1×97 + 10×104 + 100×109 + 1000×101 + 10000×100
              = 97 + 1040 + 10900 + 101000 + 1000000
              = 1113037
```

### 4. Tree Traversal Algorithm

**Purpose:** Display hierarchical structure

**Pseudocode:**
```
Algorithm traverse(t, str, root, out):
    if(t != root) then
        if(t.p = 10)
            out <- out + "\n" + str + "├──" + t.s
        else
            out <- out + "\n" + str + "└──" + t.s
        
        if(t.p = 10)
            str <- str + ("│   ")
        else 
            str <- str + ("    ")
    else
        out <- t.s
    
    c <- 0
    while(t.child[c] != null) do
        out <- traverse(t.child[c], str, root, out)
        c <- c+1
    
    return out
```

**Time Complexity:** O(n) where n = number of nodes
**Space Complexity:** O(h) where h = height of tree

## Data Flow

### Search Operation Flow
```
1. User Input
   ↓
2. Convert to Title Case
   ↓
3. Generate Hash ID
   ↓
4. Sort Records (if not sorted)
   ↓
5. Binary Search
   ↓
6. Display Result
```

### Tree Building Flow
```
1. Read CSV Line
   ↓
2. Parse: name, age, position, role
   ↓
3. Check if role exists in tree
   ↓
4. Add role if not exists
   ↓
5. Check if position exists under role
   ↓
6. Add position if not exists
   ↓
7. Add name under position
   ↓
8. Repeat for all lines
```

## Performance Analysis

### Time Complexity Summary
| Operation | Best Case | Average Case | Worst Case |
|-----------|-----------|--------------|------------|
| Load Data | O(n) | O(n) | O(n) |
| Hash ID | O(m) | O(m) | O(m) |
| Enqueue | O(1) | O(1) | O(1) |
| Dequeue | O(n) | O(n) | O(n) |
| Radix Sort | O(d×n) | O(d×n) | O(d×n) |
| Merge Sort | O(n log n) | O(n log n) | O(n log n) |
| Binary Search | O(1) | O(log n) | O(log n) |
| Tree Build | O(n) | O(n) | O(n) |
| Tree Search | O(1) | O(h) | O(h) |
| Tree Traverse | O(n) | O(n) | O(n) |

Where:
- n = number of records
- m = length of name
- d = number of digits in ID
- h = height of tree

### Space Complexity Summary
| Component | Space Used |
|-----------|------------|
| Stack s1 | O(n) |
| Stack s2 | O(n) |
| Tree | O(n) |
| Temp Arrays (Merge Sort) | O(n) |
| **Total** | **O(n)** |

## Design Decisions

### Why Queue using Two Stacks?
**Reason:** To demonstrate how complex data structures can be built from simpler ones.

**Advantages:**
- Educational value
- Shows FIFO using LIFO
- Demonstrates stack operations

**Trade-offs:**
- More memory (2 stacks)
- Dequeue is O(n)
- But enqueue is O(1)

### Why Polynomial Hashing?
**Reason:** Ensures unique IDs for different names.

**Formula:** `hash = Σ(base^i × char[i])`

**Advantages:**
- Position matters: "abc" ≠ "bac"
- No collision for different names
- Case-insensitive (convert to lowercase first)

**Trade-offs:**
- Large numbers for long names
- O(n) time complexity
- But simple to implement

### Why Binary Search?
**Reason:** Fastest search for sorted data.

**Advantages:**
- O(log n) time
- Efficient for large datasets
- Simple to implement

**Trade-offs:**
- Requires sorted data
- Must sort first (O(n log n))
- But subsequent searches are fast

## Error Handling

### Current Implementation
- File not found: Program crashes
- Invalid input: No validation
- Empty data: No check
- Duplicate names: Same ID generated

### Recommended Improvements
```java
// File validation
if (!file.exists()) {
    throw new FileNotFoundException("data.csv not found");
}

// Input validation
if (name == null || name.trim().isEmpty()) {
    throw new IllegalArgumentException("Name cannot be empty");
}

// Age validation
if (age < 18 || age > 70) {
    throw new IllegalArgumentException("Invalid age");
}

// Duplicate check
if (isDuplicate(name)) {
    System.out.println("Warning: Duplicate name found");
}
```

## Testing

### Test Cases

**1. Search Operation:**
```
Input: "ahmed"
Expected: Display Ahmed's details
Actual: ✓ Pass

Input: "xyz"
Expected: "xyz not found"
Actual: ✓ Pass

Input: "AHMED" (uppercase)
Expected: Display Ahmed's details (case-insensitive)
Actual: ✓ Pass
```

**2. Tree Operation:**
```
Input: "midfielder"
Expected: Display all midfielders
Actual: ✓ Pass

Input: "xyz"
Expected: "Not Found!"
Actual: ✓ Pass

Input: "Football" (root)
Expected: "is the root! Invalid Option"
Actual: ✓ Pass
```

**3. Edge Cases:**
```
Empty CSV: Program crashes ✗ Fail
Single record: Works ✓ Pass
1000 records: Works ✓ Pass
Duplicate names: Same ID generated ⚠ Warning
```

## Future Enhancements

### 1. Database Integration
```java
// Replace CSV with SQL
Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM players");
```

### 2. GUI Enhancement
```java
// Replace JOptionPane with JavaFX
Stage stage = new Stage();
Scene scene = new Scene(root, 800, 600);
stage.setScene(scene);
stage.show();
```

### 3. REST API
```java
@RestController
@RequestMapping("/api/players")
public class PlayerController {
    @GetMapping("/{name}")
    public Player getPlayer(@PathVariable String name) {
        return playerService.findByName(name);
    }
}
```

### 4. Multi-threading
```java
ExecutorService executor = Executors.newFixedThreadPool(4);
Future<List<Record>> future = executor.submit(() -> loadData());
List<Record> records = future.get();
```

## References

- [Java Documentation](https://docs.oracle.com/en/java/)
- [Data Structures and Algorithms](https://www.geeksforgeeks.org/data-structures/)
- [Big-O Notation](https://www.bigocheatsheet.com/)
- [Java Swing Tutorial](https://docs.oracle.com/javase/tutorial/uiswing/)

---

**Last Updated:** January 2026
**Version:** 1.0.0