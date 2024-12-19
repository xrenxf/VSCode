random_list = [105, 3.1, "Hello", 737, "Python", 2.7, "World", 412, 5.5, "AI"]

# Filter untuk memisahkan nilai float, int, dan string
float_list = list(filter(lambda x: isinstance(x, float), random_list))
int_list = list(filter(lambda x: isinstance(x, int), random_list))
string_list = list(filter(lambda x: isinstance(x, str), random_list))

# Map untuk memetakan nilai int menjadi satuan, puluhan, dan ratusan
def map_int_to_units_tens_hundreds(num):
    if isinstance(num, int):
        units = num % 10
        tens = (num // 10) % 10
        hundreds = (num // 100) % 10
        return {'ratusan': hundreds, 'puluhan': tens, 'satuan': units}
    return num

int_list_mapped = list(map(map_int_to_units_tens_hundreds, int_list))

# Output
print("Data Float:", float_list)
print("Data Int:")
for item in int_list_mapped: print(item)
print("Data String:", string_list)
