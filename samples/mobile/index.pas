unit index;

interface

uses
  //delphi
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  //fmx
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.TabControl,

  //codeencode
  myload;

type
  TIndexView = class(TForm)
    tbcMain: TTabControl;
    TabItem1: TTabItem;
    Image1: TImage;
    TabItem2: TTabItem;
    Image2: TImage;
    TabItem3: TTabItem;
    Image3: TImage;
    TabItem4: TTabItem;
    Image4: TImage;
    TabItem5: TTabItem;
    Image5: TImage;
    procedure TabItem1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TabItem2Click(Sender: TObject);
    procedure TabItem3Click(Sender: TObject);
    procedure TabItem4Click(Sender: TObject);
    procedure TabItem5Click(Sender: TObject);
  private
    { Private declarations }
    FLoad1: IMyLoad;
    FLoad2: IMyLoad;
    FLoad3: IMyLoad;
    FLoad4: IMyLoad;
    FLoad5: IMyLoad;
  public
    { Public declarations }
  end;

var
  IndexView: TIndexView;

implementation

{$R *.fmx}

procedure TIndexView.FormCreate(Sender: TObject);
begin
  tbcMain.ActiveTab := TabItem1;

  FLoad1 := TMyLoad.New
              .Parameters
                .Background
                  .Color($AA7165E3)
                .EndBackground
                .Circle
                  .ColorBg($FF6C37ED)
                  .ColorArc($FFFFFFFF)
                  .Size(20)
                  .Thickness(3)
                .EndCircle
                .Text
                  .Size_(14)
                  .Color__($FFFFFFFF)
                .EndText
              .EndParameters
              .Show(TabItem1, 'Loading Data');

  FLoad2 := TMyLoad.New
              .Parameters
                .Box
                  .Color_($FF4894FE)
                  .CornerRadius(12)
                  .Shadow(True)
                  .Visible(True)
                .EndBox
                .Circle
                  .ActivateBg(False)
                  .ColorArc($FFFFFFFF)
                  .Size(20)
                .EndCircle
                .Text
                  .FontFamily('Poppins')
                  .Size_(14)
                  .Color__($FFFFFFFF)
                  .Styles([])
                .EndText
              .EndParameters;

  FLoad3 := TMyLoad.New
              .Parameters
                .Background
                  .Color($DDE8E8E8)
                .EndBackground
                .Circle
                  .ColorBg($FFD0C1FC)
                  .ColorArc($FF54408C)
                  .Size(40)
                  .Thickness(4)
                .EndCircle
                .Text
                  .FontFamily('Open Sans')
                  .Size_(18)
                  .Color__($FF54408C)
                  .Styles([TFontStyle.fsBold])
                .EndText
              .EndParameters;

  FLoad4 := TMyLoad.New
              .Parameters
                .Box
                  .Color_($EE181818)
                  .CornerRadius(10)
                  .Visible(True)
                .EndBox
                .Circle
                  .ActivateBg(False)
                  .ColorArc($FFFFFFFF)
                  .Size(20)
                .EndCircle
                .Text
                  .FontFamily('Open Sans')
                  .Size_(12)
                  .Color__($FFFFFFFF)
                  .Styles([TFontStyle.fsBold])
                .EndText
              .EndParameters;

  FLoad5 := TMyLoad.New
              .Parameters
                .Circle
                  .ColorBg($AAFFFFFF)
                  .ColorArc($FF101010)
                .EndCircle
                .Text
                  .Size_(12)
                  .Color__($FF101010)
                  .Styles([TFontStyle.fsBold])
                .EndText
              .EndParameters;
end;

procedure TIndexView.FormDestroy(Sender: TObject);
begin
  FLoad1.Hide(True);
  FLoad2.Hide(True);
  FLoad3.Hide(True);
  FLoad4.Hide(True);
  FLoad5.Hide(True);
end;

procedure TIndexView.TabItem1Click(Sender: TObject);
begin
  FLoad1.Show(TabItem1, 'Loading Data');
  FLoad2.Hide;
  FLoad3.Hide;
  FLoad4.Hide;
  FLoad5.Hide;
end;

procedure TIndexView.TabItem2Click(Sender: TObject);
begin
  FLoad1.Hide;
  FLoad2.Show(TabItem2, 'Loading');
  FLoad3.Hide;
  FLoad4.Hide;
  FLoad5.Hide;
end;

procedure TIndexView.TabItem3Click(Sender: TObject);
begin
  FLoad1.Hide;
  FLoad2.Hide;
  FLoad3.Show(TabItem3, 'Sometimes it will tale time, so be patient and hold tight.');
  FLoad4.Hide;
  FLoad5.Hide;
end;

procedure TIndexView.TabItem4Click(Sender: TObject);
begin
  FLoad1.Hide;
  FLoad2.Hide;
  FLoad3.Hide;
  FLoad4.Show(TabItem4, 'You�re almost done! We�re creating your profile.');
  FLoad5.Hide;
end;

procedure TIndexView.TabItem5Click(Sender: TObject);
begin
  FLoad1.Hide;
  FLoad2.Hide;
  FLoad3.Hide;
  FLoad4.Hide;
  FLoad5.Show(TabItem5, 'Loading');
end;

end.
