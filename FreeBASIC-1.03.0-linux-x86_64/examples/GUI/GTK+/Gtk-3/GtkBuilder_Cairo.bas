' ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'< main program generated by utility                           GladeToBac V3.0 >
'< Hauptprogramm erzeugt von                                                   >
'< Generated at / Generierung am                             2011-05-18, 08:56 >
' -----------------------------------------------------------------------------
'< Program info:                                                               >
CONST PROJ_NAME = "tom" '                                                      >
CONST PROJ_DESC = "GTK cairo test" '                                           >
CONST PROJ_VERS = "0.0" '                                                      >
CONST PROJ_YEAR = "2011" '                                                     >
CONST PROJ_AUTH = "" '                                                         >
CONST PROJ_MAIL = "Thomas[ dot ]Freiherr{ at }gmx{ dot }net" '                 >
CONST PROJ_WEBS = "www.freebasic-portal.de" '                                  >
CONST PROJ_LICE = "GNU General Public License v3" '                            >
'<                                                                             >
'< Description / Beschreibung:                                                 >
'<                                                                             >
'<                                                                             >
'< License / Lizenz:                                                           >
'<                                                                             >
'< This program is free software: you can redistribute it and/or modify        >
'< it under the terms of the GNU General Public License as published by        >
'< the Free Software Foundation, either version 3 of the License, or           >
'< (at your option) any later version.                                         >
'<                                                                             >
'< This program is distributed in the hope that it will be useful, but         >
'< WITHOUT ANY WARRANTY; without even the implied warranty of                  >
'< MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU           >
'< General Public License for more details.                                    >
'<                                                                             >
'< You should have received a copy of the GNU General Public License along     >
'< with this program.  If not, see <http://www.gnu.org/licenses/>.             >
'<                                                                             >
' -----------------------------------------------------------------------------
'< Please prefer GNU GENERAL PUBLIC LICENSE to support open software.          >
'< For more information please visit:                       http://www.fsf.org >
'<                                                                             >
'< Bitte bevorzugen Sie die GNU GENERAL PUBLIC LICENSE und                     >
'< unterstuetzen Sie mit Ihrem Programm die freie Software                     >
'< Mehr Informationen finden Sie unter:                     http://www.fsf.org >
' -----------------------------------------------------------------------------
'<  GTK+tobac:                     general init / Allgemeine Initialisierungen >
    #DEFINE __USE_GTK3__ '         choose GTK version / GTK-version auswaehlen >
    #INCLUDE "gtk/gtk.bi" '                    GTK3+library / GTK3+ Bibliothek >
    gtk_init(@__FB_ARGC__, @__FB_ARGV__) '             start GKT / GTK starten >
'<  GTK+tobac:                                           end block / Blockende >
' vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv



' ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'<  GTK+tobac:                                  load GTK stuff / GTK Anbindung >
DIM AS STRING GUISTR
DIM SHARED AS GtkBuilder PTR XML
DIM SHARED AS GObject PTR window1

XML = gtk_builder_new()

SCOPE
  DIM AS GError PTR meld
  GUIstr =_
  "<?xml version=""1.0"" encoding=""UTF-8""?>" & _
  "<interface>" & _
  "<!-- interface-requires gtk+ 3.0 -->" & _
  "<object class=""GtkWindow"" id=""window1"">" & _
  "<property name=""can_focus"">False</property>" & _
  "<signal name=""destroy"" handler=""gtk_main_quit"" swapped=""no""/>" & _
  "<child>" & _
  "<object class=""GtkVBox"" id=""vbox1"">" & _
  "<property name=""visible"">True</property>" & _
  "<property name=""can_focus"">False</property>" & _
  "<property name=""border_width"">5</property>" & _
  "<property name=""spacing"">5</property>" & _
  "<child>" & _
  "<object class=""GtkButton"" id=""button1"">" & _
  "<property name=""label"" translatable=""yes"">Quit</property>" & _
  "<property name=""visible"">True</property>" & _
  "<property name=""can_focus"">True</property>" & _
  "<property name=""receives_default"">True</property>" & _
  "<property name=""use_action_appearance"">False</property>" & _
  "<signal name=""clicked"" handler=""gtk_main_quit"" swapped=""no""/>" & _
  "</object>" & _
  "<packing>" & _
  "<property name=""expand"">False</property>" & _
  "<property name=""fill"">False</property>" & _
  "<property name=""position"">0</property>" & _
  "</packing>" & _
  "</child>" & _
  "<child>" & _
  "<object class=""GtkDrawingArea"" id=""drawingarea1"">" & _
  "<property name=""width_request"">100</property>" & _
  "<property name=""height_request"">100</property>" & _
  "<property name=""visible"">True</property>" & _
  "<property name=""can_focus"">False</property>" & _
  "<signal name=""draw"" handler=""on_area_draw"" swapped=""no""/>" & _
  "</object>" & _
  "<packing>" & _
  "<property name=""expand"">True</property>" & _
  "<property name=""fill"">True</property>" & _
  "<property name=""position"">1</property>" & _
  "</packing>" & _
  "</child>" & _
  "</object>" & _
  "</child>" & _
  "</object>" & _
  "</interface>"
  IF 0 = gtk_builder_add_from_string(XML, SADD(GUISTR), LEN(GUISTR), @meld) THEN
    WITH *meld
      ?"Fehler/Error (GTK-Builder):"
      ?*.message
    END WITH
    END 2
  END IF
END SCOPE

window1 = gtk_builder_get_object(XML, @"window1")

FUNCTION on_area_draw CDECL ALIAS "on_area_draw" ( _
  BYVAL widget AS GtkWidget PTR, _
  BYVAL cr AS cairo_t PTR, _
  BYVAL user_data AS gpointer) AS gboolean EXPORT

  VAR w = gtk_widget_get_allocated_width(widget) \ 2
  VAR h = gtk_widget_get_allocated_height(widget) \ 2

  cairo_arc(cr, w, h, MIN(w, h), 0, 2 * G_PI)

  DIM AS GdkRGBA col
  gtk_style_context_get_color(gtk_widget_get_style_context (widget), _
                              0, _
                              @col)
  gdk_cairo_set_source_rgba(cr, @col)
  cairo_fill(cr)
  RETURN FALSE

END FUNCTION
'<  GTK+tobac:                                           end block / Blockende >
' vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv



' ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'<  GTK+tobac:           run GTK main, then end / GTK Hauptschleife, dann Ende >
    gtk_builder_connect_signals(XML, 0) '                   callbacks anbinden >
    gtk_widget_show_all(GTK_WIDGET(window1)) '         Hauptfenster darstellen >
    gtk_main() '                                     main loop / Hauptschleife >
    g_object_unref(XML) '                       dereference / Referenz abbauen >
'<  GTK+tobac:                                           end block / Blockende >
' vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

END 0 ' finish with return code 0 / Ende mit Returncode 0
