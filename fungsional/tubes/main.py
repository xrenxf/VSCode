from tkinter import *
from tkinter import ttk
from tkinter import messagebox
import sqlite3

root = Tk()

conn = sqlite3.connect("perpustakaan.db")
cursor = conn.cursor()

def simple_decorator(func):
    def wrapper(*args, **kwargs):
        print(f"Sebelum eksekusi {func.__name__}")
        result = func(*args, **kwargs)
        print(f"Sesudah eksekusi {func.__name__}")
        return result
    return wrapper

def create_table():
    cursor.execute("DROP TABLE IF EXISTS LIBRARY")
    query = """
    CREATE TABLE LIBRARY(
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        JUDUL TEXT NOT NULL,
        KATEGORI TEXT NOT NULL,
        NO_RAK TEXT NOT NULL,
        PENULIS TEXT,
        PENERBIT TEXT,
        TAHUN TEXT,
        STOK INT
    )
    """
    cursor.execute(query)
    conn.commit()

def isFirst(table_name):
    query = ''' SELECT count(name) FROM sqlite_master WHERE type='table' AND name='()' '''.format(table_name)
    cursor.execute(query)
    conn.commit()
    if cursor.fetchone()[0]==1 :
        return False
    else :
        return True
    
def select_all():
    query = "SELECT ID, JUDUL, KATEGORI, NO_RAK, PENULIS, PENERBIT, TAHUN, STOK FROM LIBRARY"
    cursor.execute(query)
    rows = cursor.fetchall()
    update_trv(rows)

def update_trv(rows):
    trv.delete(*trv.get_children())
    for i in rows:
        trv.insert('', 'end', values=i)

@simple_decorator
def update_people():
    if messagebox.askyesno("Harap Konfirmasi", "Apakah Anda Serius ingin memperbaharui data ini?"):
        query = """
            UPDATE LIBRARY
            SET JUDUL=:JUDUL, KATEGORI=:KATEGORI, NO_RAK=:NO_RAK, PENULIS=:PENULIS, PENERBIT=:PENERBIT, TAHUN=:TAHUN, STOK=:STOK
            WHERE ID=:ID
        """
        params = {
            'ID' : v_id.get(),
            'JUDUL' : v_judul.get(),
            'KATEGORI' : v_kategori.get(),
            'NO_RAK' : v_no_rak.get(),
            'PENULIS' : v_penulis.get(),
            'PENERBIT' : v_penerbit.get(),
            'TAHUN' : v_tahun_terbit.get(),
            'STOK' : v_stok.get()
        }
        cursor.execute(query, params)
        conn.commit()
        clear_field()
        select_all()
    else :
        return True

def add_new():
    query = """
        INSERT INTO LIBRARY
        (JUDUL, KATEGORI, NO_RAK, PENULIS, PENERBIT, TAHUN, STOK)
        VALUES (:JUDUL, :KATEGORI, :NO_RAK, :PENULIS, :PENERBIT, :TAHUN, :STOK)
        """
    params = {
        'JUDUL' : v_judul.get(),
        'KATEGORI' : v_kategori.get(),
        'NO_RAK' : v_no_rak.get(),
        'PENULIS' : v_penulis.get(),
        'PENERBIT' : v_penerbit.get(),
        'TAHUN' : v_tahun_terbit.get(),
        'STOK' : v_stok.get()
    }
    cursor.execute(query, params)
    conn.commit()
    select_all()
    clear_field()

def getrow(event):
    rowid = trv.identify_row(event.y)
    item = trv.item(rowid)
    v_id.set(item['values'][0])
    v_judul.set(item['values'][1])
    v_kategori.set(item['values'][2])
    v_no_rak.set(item['values'][3])
    v_penulis.set(item['values'][4])
    v_penerbit.set(item['values'][5])
    v_tahun_terbit.set(item['values'][6])
    v_stok.set(item['values'][7])

def clear_field():
    judul_field.delete(0, 'end')
    kategori_field.delete('')
    no_rak_field.delete('')
    penulis_field.delete(0, 'end')
    penerbit_field.delete(0, 'end')
    tahun_terbit_field.delete(0, 'end')
    stok_field.delete(0, 'end')

def search():
    q2 = q.get()
    query = """
        SELECT ID, JUDUL, KATEGORI, NO_RAK, PENULIS, PENERBIT, TAHUN, STOK FROM LIBRARY WHERE JUDUL LIKE {} OR NO_RAK like {}
    """.format("'%"+q2+"%'", "'%"+q2+"%'")
    cursor.execute(query)
    conn.commit()
    rows = cursor.fetchall()
    update_trv(rows)

def clear():
    ent.delete(0, 'end')
    clear_field()
    select_all()

def delete_book():
    id = v_id.get()
    if(messagebox.askyesno("Konfirmasi Hapus", "Apakah Anda Serius ingin menghapus data ini?")):
        query = "DELETE FROM LIBRARY WHERE ID = {}".format(id)
        cursor.execute(query)
        conn.commit()
        clear_field()
        select_all()
    else:
        return True

# Wrapper
wrapper1 = LabelFrame(root, text="Daftar Buku")
wrapper2 = LabelFrame(root, text="Pencarian")
wrapper3 = LabelFrame(root, text="Data Buku")

# Posisi Wrapper
wrapper1.pack(fill="both", expand="yes", padx=20, pady=20)
wrapper2.pack(fill="both", padx=20, pady=20)
wrapper3.pack(fill="both", padx=20, pady=20)

# Form
v_id = IntVar()
v_judul = StringVar()
v_kategori = StringVar()
v_no_rak = StringVar()
v_penulis = StringVar()
v_penerbit = StringVar()
v_tahun_terbit = StringVar()
v_stok = IntVar()

judul = Label(wrapper3, text="Judul")
judul_field = Entry(wrapper3, textvariable = v_judul)
judul.grid(row=0, column=0, sticky="w", pady=4)
judul_field.grid(row=0, column=1, columnspan=2, sticky="w", pady=4, padx=10)

kategori = Label(wrapper3, text="Kategori")
kategori_field = ttk.Combobox(wrapper3, width=17, textvariable = v_kategori)
kategori_field['values'] = (
    '000 - Umum',
    '100 - Filsafat dan Psikologi',
    '200 - Agama',
    '300 - Sosial',
    '400 - Bahasa',
    '500 - Sains dan Matematika',
    '600 - Teknologi',
    '700 - Seni dan Rekreasi',
    '800 - Literatur dan Sasta',
    '900 - Sejarah dan Geografi',
)
kategori.grid(row=1, column=0, sticky="w", pady=4)
kategori_field.grid(row=1, column=1, columnspan=2, sticky="w", pady=4, padx=10)

no_rak = Label(wrapper3, text="No Rak")
no_rak_field = ttk.Combobox(wrapper3, width=17, textvariable = v_no_rak)
no_rak_field['values']=('001', '002', '003', '004', '005')
no_rak.grid(row=2, column=0, sticky="w", pady=4)
no_rak_field.grid(row=2, column=1, columnspan=2, sticky="w", pady=4, padx=10)

penulis = Label(wrapper3, text="Penulis")
penulis_field = Entry(wrapper3, textvariable = v_penulis)
penulis.grid(row=3, column=0, sticky="w", pady=4)
penulis_field.grid(row=3, column=1, columnspan=2, sticky="w", pady=4, padx=10)

penerbit = Label(wrapper3, text="Penerbit")
penerbit_field = Entry(wrapper3, textvariable = v_penerbit)
penerbit.grid(row=0, column=3, sticky="w", pady=4, padx=10)
penerbit_field.grid(row=0, column=4, columnspan=2, sticky="w", pady=4)

tahun_terbit = Label(wrapper3, text="Tahun Terbit")
tahun_terbit_field = Entry(wrapper3, textvariable = v_tahun_terbit)
tahun_terbit.grid(row=1, column=3, sticky="w", pady=4, padx=10)
tahun_terbit_field.grid(row=1, column=4, columnspan=2, sticky="w", pady=4)

stok = Label(wrapper3, text="Stok")
stok_field = Entry(wrapper3, textvariable = v_stok)
stok.grid(row=2, column=3, sticky="w", pady=4, padx=10)
stok_field.grid(row=2, column=4, columnspan=2, sticky="w", pady=4)

frame_btn = Frame(wrapper3)
up_btn = Button(frame_btn, text="Update", command = update_people)
add_btn = Button(frame_btn, text="Tambah Baru", command= add_new)
delete_btn = Button(frame_btn, text="Hapus", command = delete_book)

add_btn.pack(side=LEFT, padx=5)
up_btn.pack(side=LEFT, padx=5)
delete_btn.pack(side=LEFT, padx=5)
frame_btn.grid(row=4, column=0, columnspan=5, sticky=W, pady=10)

# Wrapper 2 - Search
q = StringVar()
lbl = Label(wrapper2, text="Search")
lbl.pack(side=LEFT, padx=10, pady=15)
ent = Entry(wrapper2, textvariable = q)
ent.pack(side=LEFT, padx=6, pady=15)
btn = Button(wrapper2, text="Search", command = search)
btn.pack(side=LEFT, padx=6, pady=15)
cbtn = Button(wrapper2, text="Clear", command = clear)
cbtn.pack(side=LEFT, padx=6, pady=15)

# Wrapper 1 - Tabel Data
trv = ttk.Treeview(wrapper1, column=(0,1,2,3,4,5,6,7), show="headings", height=5)
style = ttk.Style()
style.theme_use("clam")
trv.pack(side=RIGHT)
trv.place(x=0, y=0)

trv.heading(0, text="ID")
trv.heading(1, text="Judul")
trv.heading(2, text="Kategori")
trv.heading(3, text="No Rak")
trv.heading(4, text="Penulis")
trv.heading(5, text="Penerbit")
trv.heading(6, text="Tahun Terbit")
trv.heading(7, text="Stok")

trv.column(0, stretch=NO, minwidth=0, width=0)
trv.column(1, width=95, minwidth=135, anchor=CENTER)
trv.column(2, width=95, minwidth=135, anchor=CENTER)
trv.column(3, width=95, minwidth=135, anchor=CENTER)
trv.column(4, width=95, minwidth=135, anchor=CENTER)
trv.column(5, width=95, minwidth=135, anchor=CENTER)
trv.column(6, width=95, minwidth=135, anchor=CENTER)
trv.column(7, width=65, minwidth=105, anchor=CENTER)

trv.bind('<Double 1>', getrow)

yscrollbar = Scrollbar(wrapper1, orient="vertical", command=trv.yview)
yscrollbar.pack(side=RIGHT, fill="y")

xscrollbar = Scrollbar(wrapper1, orient="horizontal", command=trv.xview)
xscrollbar.pack(side=BOTTOM, fill="x")

trv.configure(yscrollcommand=yscrollbar.set, xscrollcommand=xscrollbar.set)

if __name__ == '__main__' :
    root.title("Aplikasi Data Perpustakaan")
    root.geometry("700x500")
    root.resizable(FALSE, FALSE)
    if(isFirst("LIBRARY")):
        create_table()
    else :
        select_all()
    root.mainloop()
