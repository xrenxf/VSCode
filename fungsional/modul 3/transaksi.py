from functools import reduce

transactions = [
    {"product": "Buku", "price": 10000, "quantity": 2},
    {"product": "Pensil", "price": 2000, "quantity": 5},
    {"product": "Pensil", "price": 2000, "quantity": 3},
    {"product": "Pulpen", "price": 5000, "quantity": 2},
    {"product": "Buku", "price": 12000, "quantity": 1},
    {"product": "Pulpen", "price": 6000, "quantity": 4},
]

get_total_price = lambda transaction: transaction["price"] * transaction["quantity"]

product_filter_input = input("Masukkan nama produk yang ingin disaring: ")

filtered_transactions = list(filter(lambda t: t["product"] == product_filter_input, transactions))

if len(filtered_transactions) == 0:
    print(f"Tidak ada transaksi untuk produk {product_filter_input}.")
else:
    print(f"Transaksi Pembelian Produk {product_filter_input}:")
    for transaction in filtered_transactions:
        print(transaction)

    total_prices = list(map(get_total_price, filtered_transactions))

    print("\nTotal Harga untuk Setiap Transaksi Produk {}:".format(product_filter_input))
    for price in total_prices:
        print(price)

    total_income = reduce(lambda x, y: x + y, total_prices)

    print("\nTotal Pendapatan dari Transaksi Produk {}: {}".format(product_filter_input, total_income))

    total_items_sold = sum([t["quantity"] for t in filtered_transactions])
    print("\nTotal Jumlah Item Terjual dari Produk {}: {}".format(product_filter_input, total_items_sold))
