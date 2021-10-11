unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Menus, GdipApi, GdipClass, XPMan;

type
  TFrmMain = class(TForm)
    PaintBoxTop          : TPaintBox;
    PMRenderProperties   : TPopupMenu;    // PaintBoxTop popupmenu
    MIRenderQuality      : TMenuItem;
    MIRenderQualityLow   : TMenuItem;
    MIRenderQualityMedium: TMenuItem;
    MIRenderQualityHigh  : TMenuItem;
    MIRenderSmooth       : TMenuItem;
    MIRenderSmoothNone   : TMenuItem;
    MIRenderSmoothAAS    : TMenuItem;
    MIRenderSmoothHigh   : TMenuItem;
    PnlBottom            : TPanel;         // Draw properties panel
    LblString            : TLabel;
    EdtString            : TEdit;
    GPBFontProperties    : TGroupBox;
    LblFontNames         : TLabel;
    CBXFontNames         : TComboBox;
    LblFontSize          : TLabel;
    EdtFontSize          : TEdit;
    UDFontSize           : TUpDown;
    GPBBorderColor       : TGroupBox;
    LblBorderAlpha       : TLabel;
    EdtBorderAlpha       : TEdit;
    UDBorderAlpha        : TUpDown;
    LblBorderRed         : TLabel;
    EdtBorderRed         : TEdit;
    UDBorderRed          : TUpDown;
    LblBorderGreen       : TLabel;
    EdtBorderGreen       : TEdit;
    UDBorderGreen        : TUpDown;
    LblBorderBlue        : TLabel;
    EdtBorderBlue        : TEdit;
    UDBorderBlue         : TUpDown;
    GPBInnerColor        : TGroupBox;
    LblInnerAlpha        : TLabel;
    EdtInnerAlpha        : TEdit;
    UDInnerAlpha         : TUpDown;
    LblInnerRed          : TLabel;
    EdtInnerRed          : TEdit;
    UDInnerRed           : TUpDown;
    LblInnerGreen        : TLabel;
    EdtInnerGreen        : TEdit;
    UDInnerGreen         : TUpDown;
    LblInnerBlue         : TLabel;
    EdtInnerBlue         : TEdit;
    UDInnerBlue          : TUpDown;
    BtnApply             : TButton;
    XPManifest1          : TXPManifest;
    LblBorderSize: TLabel;
    EdtBorderSize: TEdit;
    UDBorderSize: TUpDown;
    
    procedure PaintBoxTopPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure CompQualityClick(Sender: TObject);
    procedure SmoothClick(Sender: TObject);
    procedure CBXFontNamesChange(Sender: TObject);
    procedure EdtStringChange(Sender: TObject);
  private

  protected
    procedure AddFontName(const FontName: string);
  public
    vDString   : string;
    vDFntName  : string;
    vDFntSize  : single;
    vDBrdSize  : single;
    vDBorderCol: TGPColor;
    vDInnerCol : TGPColor;
    vDCQ       : CompositingQuality;
    vDSM       : SmoothingMode;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
 // Enregistre quelques polices d'ecriture
 AddFontName('Arial');
 AddFontName('Arial black');
 AddFontName('Comic sans ms');
 AddFontName('Courier');
 AddFontName('Courier new');
 AddFontName('Garamond');
 AddFontName('Impact');
 AddFontName('Lucida console');
 AddFontName('Microsoft sans serif');
 AddFontName('Monotype corsiva');
 AddFontName('Tahoma');
 AddFontName('Times new roman');
 AddFontName('Trebuchet ms');
 AddFontName('Verdana');

 // selectionne la premiere police
 CBXFontNames.ItemIndex:=0;

 // Propriétés de rendus par defaut
 vDCQ:=CompositingQualityHighQuality;
 vDSM:=SmoothingModeAntiAlias;

 // Redessine
 BtnApplyClick(nil);
end;

// Ajoute une fonte existante dans la liste CBXFontNames
procedure TFrmMain.AddFontName(const FontName: string);
begin
 if Screen.Fonts.IndexOf(FontName)<>-1
 then CBXFontNames.Items.Add(FontName)
end;

// Applique les changements
procedure TFrmMain.BtnApplyClick(Sender: TObject);
begin
 // Texte
 vDString:=EdtString.Text;
 // Taille du contour
 vdBrdSize:=UDBorderSize.Position;
 // Police d'ecriture
 vDFntName:=CBXFontNames.Text;
 vdFntSize:=UDFontSize.Position;

 // Couleur du contour
 vDBorderCol:=ARGBMake(UDBorderAlpha.Position,
                       UDBorderRed.Position,
                       UDBorderGreen.Position,
                       UDBorderBlue.Position);

 // Couleur du texte
 vdInnerCol :=ARGBMake(UDInnerAlpha.Position,
                       UDInnerRed.Position,
                       UDInnerGreen.Position,
                       UDInnerBlue.Position);

 // Redessine
 PaintBoxTop.Repaint;
end;

// Definition de la qualité de rendu
procedure TFrmMain.CompQualityClick(Sender: TObject);
begin
 case (Sender as TMenuItem).Tag of
   1: vDCQ:=CompositingQualityHighSpeed;
   2: vDCQ:=CompositingQualityAssumeLinear;
   3: vDCQ:=CompositingQualityHighQuality;
   else vDCQ:=CompositingQualityHighQuality;
 end;

 PaintBoxTop.Repaint;
end;

// Definition du lissage du rendu
procedure TFrmMain.SmoothClick(Sender: TObject);
begin
 case (Sender as TMenuItem).Tag of
   1: vDSM:=SmoothingModeNone;
   2: vDSM:=SmoothingModeAntiAlias;
   3: vDSM:=SmoothingModeHighQuality;
   else vDSM:=SmoothingModeAntiAlias;
 end;

 PaintBoxTop.Repaint;
end;

// Dessin
procedure TFrmMain.PaintBoxTopPaint(Sender: TObject);
var
 DPen: TGPPen;
 Layout: TGPRect;
 Drawer: TGPGraphics;
 DBrush: TGPSolidBrush;
 DFntFam: TGPFontFamily;
 DPath: TGPGraphicsPath;
 DFntFmt: TGPStringFormat;
begin
 // Zone de dessin
 Layout.X:=0;
 Layout.Y:=0;
 Layout.Width:=(Sender as TPaintBox).Width-1;
 Layout.Height:=(Sender as TPaintBox).Height-1;

 // Creation des classes GDI+
 Drawer:=TGPGraphics.Create((Sender as TPaintBox).Canvas.Handle);
 Drawer.SetCompositingQuality(vDCQ);
 Drawer.SetSmoothingMode(vdSM);

 DPath:=TGPGraphicsPath.Create;
 DPen:=TGPPen.Create(vDBorderCol, vDBrdSize);
 DBrush:=TGPSolidBrush.Create(vDInnerCol);
 DFntFam:=TGPFontFamily.Create(vDFntName);

 DFntFmt:=TGPStringFormat.Create;
 DFntFmt.SetAlignment(StringAlignmentCenter);
 DFntFmt.SetLineAlignment(StringAlignmentCenter);

 // Efface le canvas
 Drawer.Clear(aclWhite);
 // Remise a zero du Path (facultatif)
 DPath.Reset;
 // Ajoute un dessin dans le Path
 DPath.AddString(vDString, Length(vDString), DFntFam, FontStyleRegular, vDFntSize, Layout, DFntFmt);

 // Dessine le countour du path
 Drawer.DrawPath(DPen, DPath);
 // Remplis le path
 Drawer.FillPath(DBrush, DPath);

 // Free classes GDI+
 DFntFmt.Free;
 DFntFam.Free;
 DBrush.Free;
 DPen.Free;
 DPath.Free;
 Drawer.Free;
end;

procedure TFrmMain.CBXFontNamesChange(Sender: TObject);
begin
 BtnApply.Click;
end;

procedure TFrmMain.EdtStringChange(Sender: TObject);
begin
 BtnApply.Click;
end;

end.


