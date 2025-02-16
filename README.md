# **Electo Finale Round Voting System 🗳️**

## 🚀 Overview

Welcome to the **Electo Finale Round Voting Program**, a fun and interactive assembly-based voting system that simulates an election process! This program allows **spectators**, **contestants**, **judges**, and **admins** to participate in a simulated voting round where they can cast votes for their favorite contestants.

With a password-protected admin dashboard, the system also provides vote tallies, summaries, and the ultimate winner of the election. Perfect for those learning assembly language and the basics of user input/output in low-level programming.

---

## 🎯 Key Features

### 1. **User Roles:**
   - **Spectators**: Can vote for their favorite contestant.
   - **Other Contestants**: Participate in the voting process.
   - **Judges**: Special voting rights, adding their choice to the tally.
   - **Admins**: Password-protected access to the system, viewing total votes and declaring the winner.

### 2. **Interactive Voting:**
   - **Vote for one of three contestants**: Users select a contestant (1, 2, or 3) to vote for.
   - **Live Vote Tally**: After voting, the votes are recorded and updated in real-time.

### 3. **Admin Dashboard:**
   - Admins can **view individual votes**, **check the overall vote count**, and **determine the winner** based on the highest vote count.
   - A simple password protects access to admin features.

---

## 💻 How It Works

### 1. **User Login & Validation:**
   - Each user logs in based on their type (Spectator, Contestant, Judge, or Admin).
   - **Login credentials** are verified against predefined lists for Spectators and Contestants, while Judges are checked against a separate list.
   - Admin access requires a password to enter a special menu.

### 2. **Voting Process:**
   - Once logged in, the user is presented with the **voting menu**, where they can choose one of three contestants to vote for.
   - Each vote is stored and counted towards the contestant's total.

### 3. **Admin Controls (Password-Protected):**
   - Admins have the ability to view the **vote count** for each contestant and user group.
   - The winner is determined by the highest vote count, which can be displayed by the admin.

### 4. **Winner Announcement:**
   - The **contestant with the most votes** wins, and the program will announce the result!

---

## 🔧 Setup Instructions

### Step 1: Install the Emulator

To run this program, you’ll need an emulator that can execute **8086 assembly** code. We recommend using [emu8086](http://www.emu8086.com/).

- Download and install **emu8086** on your system.
- Make sure the emulator supports **assembly** programs.

### Step 2: Compile & Run

- Download or clone the project.
- Open the `.asm` file using **emu8086** or any similar emulator.
- Run the program to interact with the voting system.

---

## 🛠️ Code Breakdown

### 1. **Login & Validation**
   - Each user is prompted to **enter their login** credentials.
   - The program compares the input with **predefined login lists** to validate the user.

### 2. **Voting Logic**
   - Once logged in, the user is shown the **voting options** (1, 2, or 3).
   - The program records the votes into counters `cnt1`, `cnt2`, and `cnt3`, which represent each contestant's vote tally.

### 3. **Admin Features**
   - **Password Protection**: Only authorized admins can view the **Admin Dashboard**.
   - Admins can view detailed **vote counts**, **total votes**, and check for the **winner**.
   - Admin can reset and rerun voting processes.

---

## 🖼️ Example Flow

**Login Prompt**:

```
Please select your role:
1. Spectator
2. Other Contestant
3. Judge
4. Admin
```

**Voting Menu**:

```
Vote for one of the contestants:
1. Con1
2. Con2
3. Con3
```

**Admin Summary**:

```
--- Individual Vote Counts ---
Con1 Votes: 5
Con2 Votes: 3
Con3 Votes: 2

--- Total Votes ---
Audience Votes: 8
Contestants Votes: 4
Judges Votes: 2

--- Winner ---
The Winner is: Contestant 1 with 5 votes!
```

---

## 🎉 Winning Result

When the votes are tallied, the program will display the winner:

```
🏆 Election Winner :: Contestant 1 🏆
Votes: 5
```

---

## 📂 Contributing

We welcome contributions from everyone! If you'd like to help improve the code, suggest new features, or report issues, feel free to fork the repository and submit a pull request.

- **Bug Fixes**: Help us track down bugs and improve performance.
- **Feature Enhancements**: Add new features or improve the voting system.
- **Documentation**: Help improve this README or create other helpful docs!

---

## 📜 License

This project is licensed under the **MIT License**. See the [LICENSE.md](LICENSE.md) file for details.

---

## 💬 Contact

If you have any questions or need support, feel free to contact us through the **Issues** section or reach out via email.

---

## 🚀 Happy Voting! 🎉
