import random

# Fungsi untuk membuat board matrix
def create_board(width):
    return [['-' for _ in range(width)] for _ in range(width)]

# Fungsi untuk menampilkan board
def display_board(board):
    for row in board:
        print(' '.join(row))

# Fungsi untuk mengacak posisi awal bidak dan goals
def generate_positions(width):
    try:
        start_position = (random.randint(0, width - 1), random.randint(0, width - 1))
        goal_position = (random.randint(0, width - 1), random.randint(0, width - 1))
        return start_position, goal_position
    except Exception as e:
        print(f"Terjadi kesalahan dalam mengenerate posisi: {e}")
        return generate_positions(width)  # Coba lagi jika terjadi kesalahan

# Fungsi untuk menggerakkan bidak
move_piece = lambda board, position, direction: (
    (position[0] + direction[0], position[1] + direction[1])
)

# Main game loop
def main():
    width = int(input("Masukkan lebar board: "))
    board = create_board(width)
    start_position, goal_position = generate_positions(width)

    board[start_position[0]][start_position[1]] = 'A'
    board[goal_position[0]][goal_position[1]] = 'O'

    display_board(board)

    while start_position != goal_position:
        move = input("Masukkan arah pergerakan (w/a/s/d): ").lower()

        if move == 'w':
            direction = (-1, 0)
        elif move == 'a':
            direction = (0, -1)
        elif move == 's':
            direction = (1, 0)
        elif move == 'd':
            direction = (0, 1)
        else:
            print("Arah pergerakan tidak valid. Gunakan w/a/s/d.")
            continue

        new_position = move_piece(board, start_position, direction)

        if 0 <= new_position[0] < width and 0 <= new_position[1] < width:
            board[start_position[0]][start_position[1]] = ' '
            start_position = new_position
            board[start_position[0]][start_position[1]] = 'A'
            display_board(board)
        else:
            print("Bidak tidak bisa keluar dari board.")

    print("Selamat, Anda menang!")

if __name__ == "__main__":
    main()
