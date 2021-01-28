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
      Top             =   630
      Width           =   1800
   End
   Begin VB.CheckBox autosave 
      Caption         =   "AutoSave"
      Height          =   255
      Left            =   360
      TabIndex        =   0
      Top             =   600
      Width           =   255
   End
End
Attribute VB_Name = "Settings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub autosave_Click()
    If autosave.Value = 1 Then isAutoSave = True
    If autosave.Value = 0 Then isAutoSave = False
End Sub

Private Sub File1_Click()

End Sub

Private Sub Form_Load()
    If isAutoSave = True Then autosave.Value = 1
    If isAutoSave = False Then autosave.Value = 0
End Sub
