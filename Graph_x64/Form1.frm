VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5430
   ClientLeft      =   5775
   ClientTop       =   3105
   ClientWidth     =   8760
   LinkTopic       =   "Form1"
   ScaleHeight     =   5430
   ScaleWidth      =   8760
   Begin VB.CommandButton save 
      Caption         =   "保存"
      Height          =   855
      Left            =   7920
      TabIndex        =   4
      Top             =   3600
      Width           =   495
   End
   Begin VB.TextBox fileplace 
      Height          =   375
      Left            =   7200
      TabIndex        =   3
      Top             =   3000
      Width           =   1455
   End
   Begin VB.CommandButton open 
      Caption         =   "打开"
      Height          =   855
      Left            =   7320
      TabIndex        =   2
      Top             =   3600
      Width           =   495
   End
   Begin VB.CommandButton RUN 
      Caption         =   "RUN"
      Height          =   735
      Left            =   7320
      TabIndex        =   1
      Top             =   600
      Width           =   1335
   End
   Begin VB.TextBox code 
      Height          =   4695
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   6975
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

End Sub

Private Sub open_Click()
    Open "C:\BFFiles\" & fileplace.Text & ".bf" For Input As #1     '打开打开XXX路径的XXX文件（双引号里表示文件位置和文件名）
    Do While Not EOF(1)
        Line Input #1, s
        code.Text = s
    Loop     'Do...Loop表示循环读取文件的内容，并让Text1.Text=内容
    Close #1     '关闭
End Sub

Private Sub RUN_Click()
    Dim fullpath As String
    If Right(App.Path, 1) = "\" Then
        fullpath = App.Path + "GC.exe"
    Else
        fullpath = App.Path + "\" + "GC.exe"
    End If
    Shell fullpath & " " & "C:\BFFiles\" & fileplace.Text & ".bf"
End Sub

Private Sub save_Click()
Dim lj As String
lj = "C:\BFFiles\" & fileplace.Text & ".bf"
        Open lj For Output As #1
        Print #1, code.Text
        Close #1
End Sub

Private Sub Text2_Change()

End Sub
