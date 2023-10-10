# Inisialisasi variabel global expenses sebagai list kosong
expenses = []

# TODO 1: Buatlah Fungsi add_expense disini
def add_expense(date, description, amount):
    new_expense = {
        'tanggal': date,
        'deskripsi': description,
        'jumlah': amount
    }
    expenses.append(new_expense)
    return expenses

# TODO 2: Buatlah fungsi calculate_total_expenses disini
def calculate_total_expenses(expense_list):
    total = sum(expense['jumlah'] for expense in expense_list)
    return total

# TODO 3: Buatlah fungsi get_expenses_by_date disini
def get_expenses_by_date(date, expense_list):
    expenses_on_date = [expense for expense in expense_list if expense['tanggal'] == date]
    return expenses_on_date

# TODO 4: Buatlah fungsi generate_expenses_report disini
def generate_expenses_report(expense_list):
    report = []
    unique_dates = set(expense['tanggal'] for expense in expense_list)
    for date in unique_dates:
        expenses_on_date = get_expenses_by_date(date, expense_list)
        total_expenses = calculate_total_expenses(expenses_on_date)
        report_entry = f"{date}: Rp {total_expenses}"
        report.append(report_entry)
    return report

# TODO 6: Ubah fungsi berikut ke dalam bentuk lambda
get_user_input = lambda command: int(input(command))

def add_expense_interactively():
    date = input("Masukkan tanggal pengeluaran (YYYY-MM-DD): ")
    description = input("Masukkan deskripsi pengeluaran: ")
    amount = int(input("Masukkan jumlah pengeluaran: "))
    new_expenses = add_expense(date, description, amount)
    print("Pengeluaran berhasil ditambahkan.")
    return new_expenses

def view_expenses_by_date():
    date = input("Masukkan tanggal (YYYY-MM-DD): ")
    expenses_on_date = get_expenses_by_date(date, expenses)
    print(f"\nPengeluaran pada tanggal {date}:")
    for expense in expenses_on_date:
        print(f"{expense['deskripsi']} - Rp {expense['jumlah']}")

def view_expenses_report():
    print("\nLaporan Pengeluaran Harian:")
    expenses_report = generate_expenses_report(expenses)
    for entry in expenses_report:
        print(entry)

def display_menu():
    print("\n===== Aplikasi Pencatat Pengeluaran Harian =====")
    print("1. Tambah Pengeluaran")
    print("2. Total Pengeluaran Harian")
    print("3. Lihat Pengeluaran berdasarkan Tanggal")
    print("4. Lihat Laporan Pengeluaran Harian")
    print("5. Keluar")

def main():
    global expenses
    while True:
        display_menu()
        choice = get_user_input("Pilih menu (1/2/3/4/5): ")
        
        if choice == 1:
            expenses = add_expense_interactively()
        elif choice == 2:
            total_expenses = calculate_total_expenses(expenses)
            print(f"\nTotal Pengeluaran Harian: Rp {total_expenses}")
        elif choice == 3:
            view_expenses_by_date()
        elif choice == 4:
            view_expenses_report()
        elif choice == 5:
            print("Terima kasih telah menggunakan aplikasi kami.")
            break
        else:
            print("Pilihan tidak valid. Silahkan pilih menu yang benar.")

if __name__ == "__main__":
    main()
