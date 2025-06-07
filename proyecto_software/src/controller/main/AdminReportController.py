from PyQt6.QtWidgets import QMessageBox, QFileDialog
from fpdf import FPDF
import os

from model.BusinessObject import BusinessObject

class AdminReportController:
    def __init__(self, vista):
        self.vista = vista
        self.bo = BusinessObject().report
        self.last_summary = ""
        self.last_dates = ("", "")

        # Conectar señales
        self.vista.generar_informe_signal.connect(self.generar_informe)
        self.vista.exportar_pdf_signal.connect(self.exportar_pdf)

    def generar_informe(self, start, end):
        self.last_dates = (start, end)

        if start > end:
            QMessageBox.warning(self.vista, "Error", "La fecha de inicio no puede ser mayor que la fecha de fin.")
            return

        try:
            top_buyer = self.bo.get_top_buyer(start, end)
            top_seller = self.bo.get_top_seller(start, end)
            top_brand = self.bo.get_top_brand(start, end)
            total = self.bo.get_totals(start, end)
            daily = self.bo.get_daily_sales(start, end)

            if total == 0:
                resumen = f"""
Informe de Ventas del {start} al {end}:

Total de compra-ventas: {total}
ID Mayor comprador: N/A
ID Mayor vendedor: N/A
Marca más comprada: N/A
"""
                self.vista.actualizar_resultados(resumen)
                self.vista.graficar([])
                return

            resumen = f"""
Informe de Ventas del {start} al {end}:

Total de compra-ventas: {total}
ID Mayor comprador: {top_buyer[0]} ({top_buyer[1]} compras)
ID Mayor vendedor: {top_seller[0]} ({top_seller[1]} ventas)
Marca más comprada: {top_brand[0]} ({top_brand[1]} veces)
"""
            self.vista.actualizar_resultados(resumen)
            self.vista.graficar(daily)
            self.last_summary = resumen

        except Exception as e:
            QMessageBox.critical(self.vista, "Error", f"Error al generar informe: {e}")
            self.vista.actualizar_resultados("No se pudo generar el informe.")
            self.vista.graficar([])

    def exportar_pdf(self):
        if not self.last_summary:
            QMessageBox.warning(self.vista, "Aviso", "Primero debes generar el informe.")
            return

        default_name = f"informe_{self.last_dates[0]}_a_{self.last_dates[1]}.pdf"
        path, _ = QFileDialog.getSaveFileName(self.vista, "Guardar PDF", default_name, "PDF Files (*.pdf)")

        if not path:
            return

        img_path = "temp_chart.png"
        self.vista.figure.savefig(img_path)

        try:
            pdf = FPDF()
            pdf.add_page()
            pdf.set_font("Helvetica", size=12)
            for line in self.last_summary.strip().split("\n"):
                pdf.cell(200, 10, txt=line, ln=True)
            pdf.image(img_path, x=10, y=None, w=pdf.w - 20)
            pdf.output(path)
            QMessageBox.information(self.vista, "Éxito", "Informe exportado correctamente.")
        except Exception as e:
            QMessageBox.critical(self.vista, "Error", f"Error al exportar el PDF:\n{e}")
        finally:
            if os.path.exists(img_path):
                os.remove(img_path)
