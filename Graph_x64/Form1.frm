VERSION 5.00
Begin VB.Form main 
   Caption         =   "IDE"
   ClientHeight    =   5430
   ClientLeft      =   5775
   ClientTop       =   3105
   ClientWidth     =   8760
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5430
   ScaleWidth      =   8760
   Begin VB.CommandButton Setting 
      Caption         =   "设置"
      Height          =   350
      Left            =   8050
      TabIndex        =   5
      Top             =   5100
      Width           =   700
   End
   Begin VB.CommandButton save 
      Caption         =   "保存"
      Height          =   855
      Left            =   7920
      TabIndex        =   4
      Top             =   3600
      Width           =   495
   End
   Begin VB.TextBox fileplace 
      Height          =   350
      Left            =   7200
      TabIndex        =   3
      Top             =   3100
      Width           =   1500
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
      Left            =   7280
      TabIndex        =   1
      Top             =   600
      Width           =   1350
   End
   Begin VB.TextBox code 
      Height          =   4695
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      ToolTipText     =   "Code Here"
      Top             =   240
      Width           =   7000
   End
End
Attribute VB_Name = "main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

End Sub

Private Sub Form_Load()
    Open "C:\Users\user\Desktop\costomsave.bfs" For Input As #2
        Line Input #2, PlaceToSaveFile
    Close #2
    
    Open "C:\Users\user\Desktop\costomsets.bfs" For Input As #1
        Line Input #1, AutosaveCostomSet
    Close #1
    
    If AutosaveCostomSet = "AutoSave = 1" Then isAutoSave = True
    If AutosaveCostomSet = "AutoSave = 0" Then isAutoSave = False
    
End Sub

Private Sub open_Click()
    Open PlaceToSaveFile & fileplace.Text & ".bf" For Input As #1     '打开打开XXX路径的XXX文件（双引号里表示文件位置和文件名）
    Do While Not EOF(1)
        Line Input #1, s
        code.Text = s
    Loop     'Do...Loop表示循环读取文件的内容，并让Text1.Text=内容
    Close #1     '关闭
End Sub

Private Sub RUN_Click()
    If isAutoSave = True Then Call save_Click
    Dim fullpath As String
    If Right(App.Path, 1) = "\" Then
        fullpath = App.Path + "GC.exe"
    Else
        fullpath = App.Path + "\" + "GC.exe"
    End If
    'code.Text = fullpath
    Shell fullpath & " " & PlaceToSaveFile & fileplace.Text & ".bf"     'fullpath中GC.exe路径只有在生成主程序且在程序根目录下才有效
End Sub

Private Sub save_Click()
    Dim lj As String
    lj = PlaceToSaveFile & fileplace.Text & ".bf"
        Open lj For Output As #1
        Print #1, code.Text
        Close #1
End Sub

Private Sub Text2_Change()

End Sub

Private Sub Setting_Click()
    Settings.Show
End Sub
