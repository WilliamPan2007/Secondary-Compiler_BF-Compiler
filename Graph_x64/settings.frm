VERSION 5.00
Begin VB.Form settings 
   Caption         =   "Settings"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form2"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  '窗口缺省
   Begin VB.TextBox Text1 
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      Height          =   270
      Left            =   2880
      Locked          =   -1  'True
      TabIndex        =   4
      Text            =   "输入文件保存路径"
      Top             =   780
      Width           =   1695
   End
   Begin VB.TextBox filelocation 
      Height          =   270
      Left            =   450
      TabIndex        =   3
      Text            =   "C:\Users\2-20191242\Desktop\"
      Top             =   780
      Width           =   2295
   End
   Begin VB.TextBox copyright 
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      Height          =   270
      Left            =   230
      Locked          =   -1  'True
      TabIndex        =   2
      Text            =   " Secondary Com Copyright (C) 2021 William Pan"
      Top             =   2750
      Width           =   4200
   End
   Begin VB.TextBox autosavetext 
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      Height          =   270
      Left            =   720
      Locked          =   -1  'True
      TabIndex        =   1
      TabStop         =   0   'False
      Text            =   "单击运行后自动保存"
      Top             =   500
      Width           =   1800
   End
   Begin VB.CheckBox autosave 
      Height          =   270
      Left            =   450
      TabIndex        =   0
      Top             =   470
      Width           =   270
   End
End
Attribute VB_Name = "Settings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub autosave_Click()
    Dim strusername As String
        strusername = Environ("USERNAME")
    If autosave.Value = 1 Then
        isAutoSave = True
        Dim setas As String
            setas = "C:\Users\" & strusername & "\Desktop\costomsets.bfs"
            Open setas For Output As #2
            Print #2, "AutoSave = 1"
            Close #2
    End If
    If autosave.Value = 0 Then
        isAutoSave = False
        Dim setas2 As String
            setas2 = "C:\Users\" & strusername & "\Desktop\costomsets.bfs"
            Open setas2 For Output As #2
            Print #2, "AutoSave = 0"
            Close #2
    End If
End Sub

Private Sub File1_Click()

End Sub

Private Sub filelocation_Change()
    Dim strusername As String
        strusername = Environ("USERNAME")
    PlaceToSaveFile = filelocation.Text
    Dim setplace As String
            setplace = "C:\Users\" & strusername & "\Desktop\costomsave.bfs"
            Open setplace For Output As #2
            Print #2, filelocation.Text
    Close #2
End Sub

Private Sub Form_Load()
    filelocation.Text = PlaceToSaveFile
    If isAutoSave = True Or AutosaveCostomSet = "AutoSave = 1" Then autosave.Value = 1
    If isAutoSave = False Or AutosaveCostomSet = "AutoSave = 0" Then autosave.Value = 0
End Sub
