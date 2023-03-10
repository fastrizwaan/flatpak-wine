import zenity

res,_ = zenity.show(zenity.question,text="Is it ok?")

if res:
    print("it's ok")

