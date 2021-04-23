import os
from time import sleep
from tkinter import (HORIZONTAL, Button, Checkbutton, Frame, IntVar, Label,
                     Scale, Tk, filedialog, ttk)

from JournalAction import JournalAction
from JournalEvaluation import JournalEvaluation
from Journal import Journal

intVar = []
selection = 0
journal_list = []
type_list = ['book series', 'conference and proceedings',
             'journal', 'trade journal']


def switch_property(direction):
    if direction == 'prev':
        message = action_data_agent.goto_prev_property()
    else:
        message = action_data_agent.goto_next_property()
    result_message['text'] = message


def properties_filter():
    JournalAction.properties.clear()

    args = {'pu': publisher_select.get(),
            'co': country_select.get(),
            'ca': category_select.get(),
            'ti': title_select.get(),
            'sj': float(sjr_scale.get()),
            'hi': float(h_index_scale.get())}
    allowed_type = []
    for idx in range(len(intVar)):
        if intVar[idx].get():
            allowed_type.append(type_list[idx])
    args['ty'] = allowed_type
    evaluate = JournalEvaluation(args)
    evaluate.print_rule()

    for j in journal_list:
        if evaluate.qualified(j):
            JournalAction.properties.append(j)

    print('[RESULT]:', len(JournalAction.properties))
    JournalAction.properties = sorted(
        JournalAction.properties, key=lambda j: j.cbd if type(j.cbd) == float else -1, reverse=True)
    if len(JournalAction.properties):
        JournalAction.selection = 0
        result_message['text'] = action_data_agent.change_display()
    else:
        result_message['text'] = 'Sorry I cannot find any journal suitable for you !'


if __name__ == '__main__':

    window = Tk()
    window.title("Journal Recommender System")
    window.geometry('1122x680')
    window.configure(bg='#343540')
    window.resizable(width=False, height=False)

    message = Label(window, text='Journal Recommender System',
                    font=('Calibri', 20), background = '#343540', foreground='white')
    result_window = Frame(window, width=1024, height=180, bg='#343540')
    result_window.propagate(0)
    message.grid(row=0, columnspan=5)
    

    publisher_label = Label(window, text='Publisher',
                            font=('Calibri', 12, 'bold'), background = '#343540', foreground='white')
    country_label = Label(window, text='Country', font=('Calibri', 12, 'bold'), background = '#343540', foreground='white')
    category_label = Label(window, text='Category', font=('Calibri', 12, 'bold'), background = '#343540', foreground='white')
    title_label = Label(window, text='Keyword', font=('Calibri', 12, 'bold'), background = '#343540', foreground='white')
    publisher_select = ttk.Entry(window)
    country_select = ttk.Combobox(window)
    category_select = ttk.Combobox(window)
    title_select = ttk.Entry(window)
    publisher_label.grid(row=1, column=0)
    publisher_select.grid(row=1, column=1)
    country_label.grid(row=1, column=2)
    country_select.grid(row=1, column=3)
    category_label.grid(row=2, column=0)
    category_select.grid(row=2, column=1)
    title_label.grid(row=2, column=2)
    title_select.grid(row=2, column=3)

    sjr_scale = Scale(window, label='SJR should be higher than', from_=0, to=10000, orient=HORIZONTAL,
                      length=500, showvalue=1, tickinterval=1000, resolution=20, background = '#343540', foreground='white')
    sjr_scale.grid(row=4, column=0, columnspan=2)
    h_index_scale = Scale(window, label='H index should be higher than', from_=0, to=1160, orient=HORIZONTAL,
                          length=400, showvalue=1, tickinterval=100, resolution=1, background = '#343540', foreground='white')
    h_index_scale.grid(row=4, column=2, columnspan=2)

    submit_btn = Button(window, text='Proceed', font=(
        'Calibri', 15), command=properties_filter)
    submit_btn.grid(row=6, column=1, ipadx=70, ipady=10, pady=10)

    type_frame = Frame(window, bg='#343540')
    type_frame.grid(row=1, column=4, rowspan=3)
    type_note_label = Label(
        type_frame, text='Type selection', font=('Calibri', 12, 'bold'), background = '#343540', foreground='white')
    type_note_label.pack()
    for idx in range(len(type_list)):
        intVar.append(IntVar(value=1))
        check = Checkbutton(
            type_frame, text=type_list[idx], variable=intVar[idx], onvalue=1, offvalue=0)
        check.pack(side='top', expand='yes', fill='both')

    result_message = Label(result_window, text='No recommendations yet', background = '#343540', foreground='white')
    result_message.pack()
    result_window.grid(row=7, columnspan=5)

    prev_btn = Button(window, text='Previous',
                      command=lambda: switch_property('prev'))
    next_btn = Button(window, text='next',
                      command=lambda: switch_property('next'))
    prev_btn.grid(row=8, column=3, sticky='e', ipadx=20, pady=30)
    next_btn.grid(row=8, column=4, ipadx=20)

    credit = Label(window, text='Credits: Abhishek Bapna\nKumar Pranjal\nAnirudh Sood',
                    font=('Calibri', 12), background = '#343540', foreground='white')
    credit.grid(row=9, column=0)

    print('[INFO]: Current directory', os.getcwd())
    try:
        result_message['text'] = 'Loading data...'
        # csv_filepath = filedialog.askopenfilename(
        #     initialdir=os.getcwd(), title='Select csv file')
        # csv_filepath = 'scimagojr 2019.csv'
        csv_filepath = 'data.csv'
        print('[INFO]: Loading Data')
        action_data_agent = JournalAction()
        journal_list = action_data_agent.load_properties(csv_filepath)
        result_message['text'] = 'There is no recommended content yet'
        print('[INFO]: The data file is loaded')
    except Exception:
        print('[ERROR]: Failed to load data file')
        window.destroy()
        sleep(1)
        exit()
    country_select['value'] = sorted(list(Journal.Country))
    category_select['value'] = sorted(list(Journal.Categories))
    country_select.current(0)
    category_select.current(0)

    window.mainloop()
