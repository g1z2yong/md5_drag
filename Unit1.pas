unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinsDefaultPainters, cxSSheet, DB, ADODB,ShellAPI,
  StdCtrls,Unit2, cxLookAndFeels, ComCtrls;

type
  TForm1 = class(TForm)
    cxsprdsht1: TcxSpreadSheet;
    btn1: TButton;
    pb1: TProgressBar;
    btn2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DragFileProc(var Message:TMessage) ;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

var
OLDWndProc:TWndMethod;
//SL_QHASH_FileHexDigest:function(in1:Integer;str1:Pointer;str2:Integer):PWideChar;stdcall;
pos:Integer;
 
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  //load quick hasl
  //lib:=LoadLibrary('QuickHash.dll');
  //if lib <> 0 then
  //begin
  //SL_QHASH_FileHexDigest:=GetProcAddress(lib,MAKEINTRESOURCEA(30));
  //end;

  pos:=0;


  DragAcceptFiles(cxsprdsht1.Handle,True);
  OLDWndProc:=self.cxsprdsht1.WindowProc;
  Self.cxsprdsht1.WindowProc:=Self.DragFileProc;

  //init xml page
  cxsprdsht1.Sheet.GetCellObject(0,0).Text:='FullPath';
  cxsprdsht1.Sheet.GetCellObject(1,0).Text:='FileName';
  cxsprdsht1.Sheet.GetCellObject(2,0).Text:='MD5';
  cxsprdsht1.Sheet.GetCellObject(0,0).Style.Font.Style := [fsBold];
  cxsprdsht1.Sheet.GetCellObject(0,0).Style.Font.FontColor:=clRed;
  cxsprdsht1.Sheet.Cols.Size[0]:=200;
  cxsprdsht1.Sheet.Cols.Size[1]:=100;
  cxsprdsht1.Sheet.Cols.Size[2]:=200;

  //cxsprdsht1.Sheet.Rows.

end;

procedure TForm1.DragFileProc(var Message:TMessage) ;
var i:word;
p:array[0..254]of char;
filename,md5:string;

begin 
        if Message.Msg=WM_DropFiles 
        then 
                begin 
                        //self.MemoDrag.Clear; 
                        i:=DragQueryFile(Message.WParam,$FFFFFFFF,nil,0);
                        pb1.Max:=i-1;
                        //取得拖放文件总数 
                        for i:=0 to i-1 do 
                        begin 
                                DragQueryFile(Message.WParam,i,p,255); 
                                 //取得拖放文件名
                                //ShowMessage(StrPas(p));
                                md5:=MD5Print(MD5File(string(p)));
                                filename:=ExtractFileName (string(p));
                                cxsprdsht1.Sheet.GetCellObject(0,pos+1).Text:=StrPas(p);
                                cxsprdsht1.Sheet.GetCellObject(1,pos+1).Text:=filename;
                                cxsprdsht1.Sheet.GetCellObject(2,pos+1).Text:=md5;
                                pb1.Position:=i;
                                pos:=pos+1;
                                //cxsprdsht1.GridColor:=clRed;
                                cxsprdsht1.Refresh;

                                //对文件的处理
                        end; 
                end 
    else //其他消息,调用原来的处理程序 
            OLDWndProc(Message); 
end; 

procedure TForm1.btn1Click(Sender: TObject);
begin
  cxsprdsht1.SaveToFile('md5.xls');
  ShowMessage('Write OK');
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  pos:=0;
  cxsprdsht1.Sheet.ClearAll;
end;

end.
