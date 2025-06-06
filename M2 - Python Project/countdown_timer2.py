import tkinter as tk
from tkinter import messagebox
import time

def start_timer():
    try:
        hrs = int(hour_entry.get())
        mins = int(minute_entry.get())
        secs = int(second_entry.get())

        total_seconds = hrs * 3600 + mins * 60 + secs

        while total_seconds >= 0:
            hours = total_seconds // 3600
            minutes = (total_seconds % 3600) // 60
            seconds = total_seconds % 60
            timer_display.config(text=f"{hours:02d}:{minutes:02d}:{seconds:02d}")
            root.update()
            time.sleep(1)

            if total_seconds == 0:
                messagebox.showinfo("Time's Up", "Time's up!")
            total_seconds -= 1
    except ValueError:
        messagebox.showerror("Invalid Input", "Please enter valid numbers!")

root = tk.Tk()
root.title("Countdown Timer")
root.geometry("300x200")

tk.Label(root, text="Hours:").pack()
hour_entry = tk.Entry(root)
hour_entry.pack()

tk.Label(root, text="Minutes:").pack()
minute_entry = tk.Entry(root)
minute_entry.pack()

tk.Label(root, text="Seconds:").pack()
second_entry = tk.Entry(root)
second_entry.pack()

timer_display = tk.Label(root, text="00:00:00", font=("Helvetica", 24))
timer_display.pack(pady=10)

start_button = tk.Button(root, text="Start Timer", command=start_timer)
start_button.pack()

root.mainloop()
