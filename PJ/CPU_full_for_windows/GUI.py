import os
import yaml
import subprocess
import random
import PySimpleGUI as sg
testlist = ['abs-asum-cmov','abs-asum-jmp','asum','asumi','asumr','cjr','j-cc','poptest','prog1','prog2','prog3','prog4','prog5','prog6','prog7','prog8','prog9','prog10','pushquestion','pushtest','ret-hazard','mytest']
reglist = ['rax','rcx','rdx','rbx','rsp','rbp','rsi','rdi','r8','r9','r10','r11','r12','r13','r14']
instrulist = ['icode','ifunc','rA','rB','valC']
instrurawlist = ['icodefull','ifuncfull','rAfull','rBfull']
CClist = ['ZF','SF','OF']
envlist = ['valA','valB','valP','valE','valM','Cnd']
rawlist = ['HALT','NOP','RRMOVQ','IRMOVQ','RMMOVQ','MRMOVQ','OPQ','JXX','CALL','RET','PUSH','POPQ','INCQ','DECQ','CMPQ','TESTQ']
oplist = ['ADD','SUB','AND','XOR','OR','SHL','SHR','SAR','MULQ','DIVQ','REMQ','MODQ','MINQ','MAXQ']
cmplist = ['TRUE','LE','L','E','NE','GE','G']
lineA = "30f60000000000000000"
lineB = "30f70000000000000000"
mytest = 0
newlineA = ""
newlineB = ""

leftlayout = [
    [sg.Text('选择测试',key='chose',size=(32,1),font=(None,18))],

    [sg.Drop(testlist,default_value='',key='tests',font=(None,18)),\
     sg.Button('启动！',font=(None,18),size=(6,1)),\
     sg.Button('重选',font=(None,18),size=(6,1),disabled=True)],
    [sg.Text('\n',size=(30,1),font=(None,18))],
    [sg.Text('\t   MEMORY',size=(30,1),font=(None,19))],

    [sg.Text('\t   NO DATA',key='memory',size=(30,27),font=(None,18),background_color='white',text_color='black')],
    [sg.Text('\n\n\n\n\n',size=(30,5),font=(None,18))]
]

middlelayout = [
    [sg.Text('当前阶段',font=(None,18),size=(8,1)),\
     sg.Text('未启动',key='PHASE',font=(None,18),size=(13,1),background_color='white',text_color='black'),\
     sg.Button('下一阶段',font=(None,18),disabled=True),\
     sg.Button('上一阶段',font=(None,18),disabled=True)],

    [sg.Text('当前PC',font=(None,18),size=(8,1)),\
     sg.Text('未启动',key='PC',font=(None,18),size=(13,1),background_color='white',text_color='black'),\
     sg.Button('下一指令',font=(None,18),disabled=True),\
     sg.Button('上一指令',font=(None,18),disabled=True)],

    [sg.Text('\t\tNO DATA',key='rawinstru',font=(None,18),size=(42,1),background_color='white',text_color='black')],

    [sg.Text('  REGISTER',font=(None,18),size=(16,1)),sg.Text('\tInstruction',font=(None,18),size=(20,1))],

    [sg.Text('RAX',size=(3,1),font=(None,14)),\
     sg.Text('NULL',key='rax',size=(21,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('icode',size=(5,1),font=(None,14)),\
     sg.Text('NULL',key='icode',size=(10,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('NULL',key='icodefull',size=(11,1),font=(None,13),background_color='white',text_color='black')],

    [sg.Text('RCX',size=(3,1),font=(None,14)),\
     sg.Text('NULL',key='rcx',size=(21,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('ifunc',size=(5,1),font=(None,14)),\
     sg.Text('NULL',key='ifunc',size=(10,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('NULL',key='ifuncfull',size=(11,1),font=(None,13),background_color='white',text_color='black')],


    [sg.Text('RDX',size=(3,1),font=(None,14)),\
     sg.Text('NULL',key='rdx',size=(21,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('rA',size=(5,1),font=(None,14)),\
     sg.Text('NULL',key='rA',size=(10,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('NULL',key='rAfull',size=(11,1),font=(None,13),background_color='white',text_color='black')],
    
    [sg.Text('RBX',size=(3,1),font=(None,14)),\
     sg.Text('NULL',key='rbx',size=(21,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('rB',size=(5,1),font=(None,14)),\
     sg.Text('NULL',key='rB',size=(10,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('NULL',key='rBfull',size=(11,1),font=(None,13),background_color='white',text_color='black')],

    [sg.Text('RSP',size=(3,1),font=(None,14)),\
     sg.Text('NULL',key='rsp',size=(21,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('valC',size=(5,1),font=(None,14)),\
     sg.Text('NULL',key='valC',size=(21,1),font=(None,13),background_color='white',text_color='black')],


    [sg.Text('RBP',size=(3,1),font=(None,14)),\
     sg.Text('NULL',key='rbp',size=(21,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('     Environment',font=(None,18),size=(23,1))],

    [sg.Text('RSI',size=(3,1),font=(None,14)),\
     sg.Text('NULL',key='rsi',size=(21,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('ZF',size=(5,1),font=(None,14)),\
     sg.Text('NULL',key='ZF',size=(21,1),font=(None,13),background_color='white',text_color='black')],

    [sg.Text('RDI',size=(3,1),font=(None,14)),\
     sg.Text('NULL',key='rdi',size=(21,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('SF',size=(5,1),font=(None,14)),\
     sg.Text('NULL',key='SF',size=(21,1),font=(None,13),background_color='white',text_color='black')],

    [sg.Text('R8',size=(3,1),font=(None,14)),\
     sg.Text('NULL',key='r8',size=(21,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('OF',size=(5,1),font=(None,14)),\
     sg.Text('NULL',key='OF',size=(21,1),font=(None,13),background_color='white',text_color='black')],

    [sg.Text('R9',size=(3,1),font=(None,14)),\
     sg.Text('NULL',key='r9',size=(21,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('State',size=(5,1),font=(None,14)),\
     sg.Text('NULL',key='STAT',size=(21,1),font=(None,13),background_color='white',text_color='black')],

    [sg.Text('R10',size=(3,1),font=(None,14)),\
     sg.Text('NULL',key='r10',size=(21,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('valA',size=(5,1),font=(None,14)),\
     sg.Text('NULL',key='valA',size=(21,1),font=(None,13),background_color='white',text_color='black')],

    [sg.Text('R11',size=(3,1),font=(None,14)),\
     sg.Text('NULL',key='r11',size=(21,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('valB',size=(5,1),font=(None,14)),\
     sg.Text('NULL',key='valB',size=(21,1),font=(None,13),background_color='white',text_color='black')],

    [sg.Text('R12',size=(3,1),font=(None,14)),\
     sg.Text('NULL',key='r12',size=(21,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('valP',size=(5,1),font=(None,14)),\
     sg.Text('NULL',key='valP',size=(21,1),font=(None,13),background_color='white',text_color='black')],

    [sg.Text('R13',size=(3,1),font=(None,14)),\
     sg.Text('NULL',key='r13',size=(21,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('valE',size=(5,1),font=(None,14)),\
     sg.Text('NULL',key='valE',size=(21,1),font=(None,13),background_color='white',text_color='black')],

    [sg.Text('R14',size=(3,1),font=(None,14)),\
     sg.Text('NULL',key='r14',size=(21,1),font=(None,13),background_color='white',text_color='black'),\
     sg.Text('valM',size=(5,1),font=(None,14)),\
     sg.Text('NULL',key='valM',size=(21,1),font=(None,13),background_color='white',text_color='black')],

     [sg.Text('',size=(3,1),font=(None,14)),\
     sg.Text('',size=(21,1),font=(None,13)),\
     sg.Text('Cnd',size=(5,1),font=(None,14)),\
     sg.Text('NULL',key='Cnd',size=(21,1),font=(None,13),background_color='white',text_color='black')]
]

rightlayout = [
    [sg.Text('\t\t文件内容',size=(40,1),font=(None,18))],
    [sg.Text('\t\t\t\tNO DATA',key = 'text',size=(64,47),background_color='white',text_color='black')],
    [sg.Text('\t\t\t\t\t非常简单GUI, 爱来自GODKE\n',size=(64,2))],
]


left = sg.Column(leftlayout)
middle = sg.Column(middlelayout)
right = sg.Column(rightlayout)

mainlayout = [[left,middle,right]]

PC = 0
data = 0
PCmax = 0

def main():
    window = sg.Window('Y86-64 CPU',mainlayout).finalize()
    window.Maximize()
    while True:
        event,values = window.read()

        if event == None:
            break
        if event == '启动！':
            if values['tests'] == '原神':
                arg = random.choice(testlist)
            else:
                arg = values['tests']
                if arg not in testlist:
                    continue

            run(window, event, arg)
            
        if event in {'重选','上一阶段','下一阶段','上一指令','下一指令'}:
            run(window, event, None)

    window.close()

def run(window, instru, arg = None):
    global PC
    global data
    global PCmax
    global mytest
    global newlineA
    global newlineB
    match instru:
        case '启动！':
            os.makedirs('currentTEST',exist_ok=True)
            if arg == 'mytest':
                mytest = 1
                filedata = ""
                values = sg.popup_get_text('输入valueA和valueB,以空格隔开',title='参数输入',font=(None,30))
                if not values:
                    return
                values = values.split()
                newlineA = "30f6" + getnum(values[0])
                newlineB = "30f7" + getnum(values[1])
                with open(f"test/mytest.yo",'r') as tf:
                    for line in tf:
                        if lineA in line:
                            line = line.replace(lineA,newlineA)
                        if lineB in line:
                            line = line.replace(lineB,newlineB)
                        filedata += line
                with open(f"test/mytest.yo",'w') as tf:
                    tf.write(filedata)
            
            with open(f"test/{arg}.yo",'r') as f:
                text = f.read()
            subprocess.run(["./CPU.exe"],stdin=open(f"test/{arg}.yo"),stdout=open(f"currentTEST/result.yaml",'w'))
            with open(f"currentTEST/result.yaml") as yf:
                data = yaml.safe_load(yf)
            if mytest == 1:
                filedata = ""
                with open(f"test/mytest.yo",'r') as tf:
                    for line in tf:
                        if newlineA in line:
                            line = line.replace(newlineA,lineA)
                        if newlineB in line:
                            line = line.replace(newlineB,lineB)
                        filedata += line
                with open(f"test/mytest.yo",'w') as tf:
                    tf.write(filedata)
            PCmax = len(data)
            window['text'].Update(value = text)
            window['chose'].Update(value = '现在测试')
            window['tests'].Update(value = arg, disabled = True)
            window['启动！'].Update(disabled = True)
            window['重选'].Update(disabled = False)
            window['下一阶段'].Update(disabled = False)
            window['下一指令'].Update(disabled = False)
            updateall(window, data)
        case '重选':
            window['chose'].Update(value = '选择测试')
            window['tests'].Update(value = '', values = testlist, disabled = False)
            window['启动！'].Update(disabled = False)
            window['重选'].Update(disabled = True)
            window['下一阶段'].Update(disabled = True)
            window['下一指令'].Update(disabled = True)
            window['上一阶段'].Update(disabled = True)
            window['上一指令'].Update(disabled = True)
            window['text'].Update(value = '\t\t\t\tNO DATA')
            data = 0
            PC = 0
            updateall(window,0)
        case '上一指令':
            PC = (PC//7)*7 - 7
            updateall(window,data)
            updatebutton(window)
        case '下一指令':
            PC = (PC//7)*7 + 7
            updateall(window,data)
            updatebutton(window)
        case '上一阶段':
            PC = PC - 1
            updateall(window,data)
            updatebutton(window)
        case '下一阶段':
            PC = PC + 1
            updateall(window,data)
            updatebutton(window)

def updateall(window, data):
    if data != 0:
        match data[PC].get('PHASE'):
            case 0:
                phase = '0 (READY)'
            case 1:
                phase = '1 (FETCH)'
            case 2:
                phase = '2 (DECODE)'
            case 3:
                phase = '3 (EXECUTE)'
            case 4:
                phase = '4 (MEMORY)'
            case 5:
                phase = '5 (WRITEBACK)'
            case 6:
                phase = '6 (UPDATEPC)'
        
        window['PC'].Update(value = data[PC].get('PC'))
        window['PHASE'].Update(value = phase)
        window['STAT'].update(value = data[PC].get('STAT'))

        icode = '{:x}'.format(data[PC].get('INSTRU').get('icode'))
        ifunc = '{:x}'.format(data[PC].get('INSTRU').get('ifunc'))
        rA = data[PC].get('INSTRU').get('rA')
        rB = data[PC].get('INSTRU').get('rB')
        if rA == 15 and rB == 15:
            strrA = ''
            strrB = ''
        else:
            strrA = '{:x}'.format(rA)
            strrB = '{:x}'.format(rB)
        if data[PC].get('INSTRU').get('hasvalC'):
            valCA = '{:08x}'.format(data[PC].get('INSTRU').get('rawvalCA'))
            valCB = '{:08x}'.format(data[PC].get('INSTRU').get('rawvalCB'))
            valC = valCA + valCB
        else:
            valC = ''
        rawinstru = '0x{:03x}: '.format(data[PC].get('PC'))+icode+ifunc+strrA+strrB+valC
        window['rawinstru'].Update(value = rawinstru)

        memory = ''
        for key in data[PC].get('MEM').keys():
            memory = memory + str(key) + ': ' + str(data[PC].get('MEM').get(key)) + '\n'
        window['memory'].update(value = memory)

        for item in reglist:
            window[item].Update(value = data[PC].get('REG').get(item))
        for item in CClist:
            window[item].Update(value = data[PC].get('CC').get(item))
        for item in instrulist:
            window[item].Update(value = data[PC].get('INSTRU').get(item))
        for item in envlist:
            window[item].Update(value = data[PC].get('ENV').get(item))
        if PC != 0:
            window['icodefull'].Update(value = rawlist[data[PC].get('INSTRU').get('icode')])
            if rA == 15:
                window['rAfull'].Update(value = 'RNONE')
            else:
                window['rAfull'].Update(value = reglist[rA])
            if rB == 15:
                window['rBfull'].Update(value = 'RNONE')
            else:
                window['rBfull'].Update(value = reglist[rB])    
        match data[PC].get('INSTRU').get('icode'):
            case 6:
                window['ifuncfull'].Update(value = oplist[data[PC].get('INSTRU').get('ifunc')])    
            case 7:
                window['ifuncfull'].Update(value = cmplist[data[PC].get('INSTRU').get('ifunc')])
            case 2:
                window['icodefull'].Update(value = 'CMOVQ')
                window['ifuncfull'].Update(value = cmplist[data[PC].get('INSTRU').get('ifunc')])
        if icode not in {'6','7','2'}:
            window['ifuncfull'].Update(value = 'NULL')

    else:
        window['PC'].Update(value = '未启动')
        window['PHASE'].Update(value = '未启动')
        window['STAT'].update(value = 'NULL')
        window['rawinstru'].Update(value = '\t\tNO DATA')
        window['memory'].update(value = '\t   NO DATA')
        for item in reglist:
            window[item].Update(value = 'NULL')
        for item in CClist:
            window[item].Update(value = 'NULL')
        for item in instrulist:
            window[item].Update(value = 'NULL')
        for item in envlist:
            window[item].Update(value = 'NULL')
        for item in instrurawlist:
            window[item].Update(value = 'NULL')

def updatebutton(window):
    global PC
    global PCmax
    if PC > 0:
        window['上一阶段'].Update(disabled = False)
    else:
        window['上一阶段'].Update(disabled = True)

    if PC > 6:
        window['上一指令'].update(disabled = False)
    else:
        window['上一指令'].update(disabled = True)

    if PC < PCmax-1:
        window['下一阶段'].Update(disabled = False)
    else:
        window['下一阶段'].Update(disabled = True)
    
    if PC < PCmax-7:
        window['下一指令'].Update(disabled = False)
    else:
        window['下一指令'].Update(disabled = True)
    
    if PC == PCmax - 1:
        window['PHASE'].Update(value = 'FINISHED')

def getnum(valueA):
    valueA = int(valueA.strip('-'))
    numA = ''
    while valueA != 0:
        down = '{:x}'.format(valueA % 16)
        valueA = valueA // 16
        up = '{:x}'.format(valueA % 16)
        valueA = valueA // 16
        numA += up + down
    while len(numA) < 16:
        numA += '0'
    return numA

main()

