namespace etapa_4
{
    partial class CEmestre
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && components != null)
                components.Dispose();
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        private void InitializeComponent()
        {
            layoutPrincipal = new TableLayoutPanel();
            panelSuperior = new Panel();
            lblTitulo = new Label();
            btnCargarArchivos = new Button();
            layoutContenido = new TableLayoutPanel();
            panelCombinaciones = new TableLayoutPanel();
            lblCombinaciones = new Label();
            lblCriterio = new Label();
            cmbCriterio = new ComboBox();
            lstCombinaciones = new ListBox();
            lblAyudaCombinaciones = new Label();
            panelHorario = new TableLayoutPanel();
            lblHorario = new Label();
            lblDetalleHorario = new Label();
            panelDesplazamientoHorario = new Panel();
            tlpHorarioSemanal = new TableLayoutPanel();
            lblDia0 = new Label();
            lblDia1 = new Label();
            lblDia2 = new Label();
            lblDia3 = new Label();
            lblDia4 = new Label();
            lblDia5 = new Label();
            lblDia6 = new Label();
            lblHora7 = new Label();
            lblHora8 = new Label();
            lblHora9 = new Label();
            lblHora10 = new Label();
            lblHora11 = new Label();
            lblHora12 = new Label();
            lblHora13 = new Label();
            lblHora14 = new Label();
            lblHora15 = new Label();
            lblHora16 = new Label();
            lblHora17 = new Label();
            lblHora18 = new Label();
            lblHora19 = new Label();
            lblHora20 = new Label();
            lblHora21 = new Label();
            panelInferior = new TableLayoutPanel();
            panelCreditos = new Panel();
            lblCreditosTotales = new Label();
            lblCreditosTitulo = new Label();
            panelValidez = new Panel();
            lblEstadoCombinacion = new Label();
            lblValidezTitulo = new Label();
            panelMotivo = new Panel();
            lblMotivoRechazo = new Label();
            lblMotivoTitulo = new Label();
            layoutPrincipal.SuspendLayout();
            panelSuperior.SuspendLayout();
            layoutContenido.SuspendLayout();
            panelCombinaciones.SuspendLayout();
            panelHorario.SuspendLayout();
            panelDesplazamientoHorario.SuspendLayout();
            tlpHorarioSemanal.SuspendLayout();
            panelInferior.SuspendLayout();
            panelCreditos.SuspendLayout();
            panelValidez.SuspendLayout();
            panelMotivo.SuspendLayout();
            SuspendLayout();
            // 
            // layoutPrincipal
            // 
            layoutPrincipal.BackColor = Color.FromArgb(242, 245, 249);
            layoutPrincipal.ColumnCount = 1;
            layoutPrincipal.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100F));
            layoutPrincipal.Controls.Add(panelSuperior, 0, 0);
            layoutPrincipal.Controls.Add(layoutContenido, 0, 1);
            layoutPrincipal.Controls.Add(panelInferior, 0, 2);
            layoutPrincipal.Dock = DockStyle.Fill;
            layoutPrincipal.Location = new Point(0, 0);
            layoutPrincipal.Margin = new Padding(0);
            layoutPrincipal.Name = "layoutPrincipal";
            layoutPrincipal.RowCount = 3;
            layoutPrincipal.RowStyles.Add(new RowStyle(SizeType.Absolute, 96F));
            layoutPrincipal.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));
            layoutPrincipal.RowStyles.Add(new RowStyle(SizeType.Absolute, 104F));
            layoutPrincipal.Size = new Size(1160, 780);
            layoutPrincipal.TabIndex = 0;
            // 
            // panelSuperior
            // 
            panelSuperior.BackColor = Color.FromArgb(24, 43, 73);
            panelSuperior.Controls.Add(lblTitulo);
            panelSuperior.Controls.Add(btnCargarArchivos);
            panelSuperior.Dock = DockStyle.Fill;
            panelSuperior.Location = new Point(0, 0);
            panelSuperior.Margin = new Padding(0);
            panelSuperior.Name = "panelSuperior";
            panelSuperior.Padding = new Padding(0, 26, 24, 26);
            panelSuperior.Size = new Size(1160, 96);
            panelSuperior.TabIndex = 0;
            // 
            // lblTitulo
            // 
            lblTitulo.AutoSize = true;
            lblTitulo.Font = new Font("Segoe UI", 25F, FontStyle.Bold);
            lblTitulo.ForeColor = Color.White;
            lblTitulo.Location = new Point(24, 26);
            lblTitulo.Name = "lblTitulo";
            lblTitulo.Size = new Size(168, 46);
            lblTitulo.TabIndex = 0;
            lblTitulo.Text = "CEmestre";
            // 
            // btnCargarArchivos
            // 
            btnCargarArchivos.BackColor = Color.FromArgb(55, 112, 222);
            btnCargarArchivos.Cursor = Cursors.Hand;
            btnCargarArchivos.Dock = DockStyle.Right;
            btnCargarArchivos.FlatAppearance.BorderSize = 0;
            btnCargarArchivos.FlatStyle = FlatStyle.Flat;
            btnCargarArchivos.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
            btnCargarArchivos.ForeColor = Color.White;
            btnCargarArchivos.Location = new Point(935, 26);
            btnCargarArchivos.Name = "btnCargarArchivos";
            btnCargarArchivos.Size = new Size(201, 44);
            btnCargarArchivos.TabIndex = 0;
            btnCargarArchivos.Text = "Cargar archivos";
            btnCargarArchivos.UseVisualStyleBackColor = false;
            // 
            // layoutContenido
            // 
            layoutContenido.ColumnCount = 2;
            layoutContenido.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 280F));
            layoutContenido.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100F));
            layoutContenido.Controls.Add(panelCombinaciones, 0, 0);
            layoutContenido.Controls.Add(panelHorario, 1, 0);
            layoutContenido.Dock = DockStyle.Fill;
            layoutContenido.Location = new Point(24, 116);
            layoutContenido.Margin = new Padding(24, 20, 24, 16);
            layoutContenido.Name = "layoutContenido";
            layoutContenido.RowCount = 1;
            layoutContenido.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));
            layoutContenido.Size = new Size(1112, 544);
            layoutContenido.TabIndex = 1;
            // 
            // panelCombinaciones
            // 
            panelCombinaciones.BackColor = Color.White;
            panelCombinaciones.ColumnCount = 1;
            panelCombinaciones.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100F));
            panelCombinaciones.Controls.Add(lblCombinaciones, 0, 0);
            panelCombinaciones.Controls.Add(lblCriterio, 0, 1);
            panelCombinaciones.Controls.Add(cmbCriterio, 0, 2);
            panelCombinaciones.Controls.Add(lstCombinaciones, 0, 3);
            panelCombinaciones.Controls.Add(lblAyudaCombinaciones, 0, 4);
            panelCombinaciones.Dock = DockStyle.Fill;
            panelCombinaciones.Location = new Point(0, 0);
            panelCombinaciones.Margin = new Padding(0, 0, 18, 0);
            panelCombinaciones.Name = "panelCombinaciones";
            panelCombinaciones.Padding = new Padding(18);
            panelCombinaciones.RowCount = 5;
            panelCombinaciones.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            panelCombinaciones.RowStyles.Add(new RowStyle(SizeType.Absolute, 26F));
            panelCombinaciones.RowStyles.Add(new RowStyle(SizeType.Absolute, 48F));
            panelCombinaciones.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));
            panelCombinaciones.RowStyles.Add(new RowStyle(SizeType.Absolute, 64F));
            panelCombinaciones.Size = new Size(262, 544);
            panelCombinaciones.TabIndex = 0;
            // 
            // lblCombinaciones
            // 
            lblCombinaciones.Dock = DockStyle.Fill;
            lblCombinaciones.Font = new Font("Segoe UI", 14F, FontStyle.Bold);
            lblCombinaciones.Location = new Point(18, 18);
            lblCombinaciones.Margin = new Padding(0);
            lblCombinaciones.Name = "lblCombinaciones";
            lblCombinaciones.Size = new Size(226, 40);
            lblCombinaciones.TabIndex = 0;
            lblCombinaciones.Text = "Combinaciones";
            // 
            // lblCriterio
            // 
            lblCriterio.Dock = DockStyle.Fill;
            lblCriterio.ForeColor = Color.FromArgb(94, 111, 133);
            lblCriterio.Location = new Point(18, 58);
            lblCriterio.Margin = new Padding(0);
            lblCriterio.Name = "lblCriterio";
            lblCriterio.Size = new Size(226, 26);
            lblCriterio.TabIndex = 1;
            lblCriterio.Text = "Ordenar por";
            // 
            // cmbCriterio
            // 
            cmbCriterio.AccessibleName = "Criterio de orden de combinaciones";
            cmbCriterio.Dock = DockStyle.Top;
            cmbCriterio.DropDownStyle = ComboBoxStyle.DropDownList;
            cmbCriterio.DropDownWidth = 290;
            cmbCriterio.FlatStyle = FlatStyle.Flat;
            cmbCriterio.Items.AddRange(new object[] { "Menos días en el TEC", "Menos créditos totales" });
            cmbCriterio.Location = new Point(18, 84);
            cmbCriterio.Margin = new Padding(0);
            cmbCriterio.Name = "cmbCriterio";
            cmbCriterio.Size = new Size(226, 23);
            cmbCriterio.TabIndex = 0;
            // 
            // lstCombinaciones
            // 
            lstCombinaciones.AccessibleName = "Combinaciones válidas y rechazadas";
            lstCombinaciones.BorderStyle = BorderStyle.FixedSingle;
            lstCombinaciones.Dock = DockStyle.Fill;
            lstCombinaciones.HorizontalScrollbar = true;
            lstCombinaciones.IntegralHeight = false;
            lstCombinaciones.Location = new Point(18, 132);
            lstCombinaciones.Margin = new Padding(0);
            lstCombinaciones.Name = "lstCombinaciones";
            lstCombinaciones.Size = new Size(226, 330);
            lstCombinaciones.TabIndex = 1;
            // 
            // lblAyudaCombinaciones
            // 
            lblAyudaCombinaciones.Dock = DockStyle.Fill;
            lblAyudaCombinaciones.ForeColor = Color.FromArgb(94, 111, 133);
            lblAyudaCombinaciones.Location = new Point(18, 462);
            lblAyudaCombinaciones.Margin = new Padding(0);
            lblAyudaCombinaciones.Name = "lblAyudaCombinaciones";
            lblAyudaCombinaciones.Padding = new Padding(0, 12, 0, 0);
            lblAyudaCombinaciones.Size = new Size(226, 64);
            lblAyudaCombinaciones.TabIndex = 2;
            lblAyudaCombinaciones.Text = "Sin combinaciones cargadas.\r\nSelecciona una para ver su horario.";
            // 
            // panelHorario
            // 
            panelHorario.BackColor = Color.White;
            panelHorario.ColumnCount = 1;
            panelHorario.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100F));
            panelHorario.Controls.Add(lblHorario, 0, 0);
            panelHorario.Controls.Add(lblDetalleHorario, 0, 1);
            panelHorario.Controls.Add(panelDesplazamientoHorario, 0, 2);
            panelHorario.Dock = DockStyle.Fill;
            panelHorario.Location = new Point(280, 0);
            panelHorario.Margin = new Padding(0);
            panelHorario.Name = "panelHorario";
            panelHorario.Padding = new Padding(18);
            panelHorario.RowCount = 3;
            panelHorario.RowStyles.Add(new RowStyle(SizeType.Absolute, 36F));
            panelHorario.RowStyles.Add(new RowStyle(SizeType.Absolute, 30F));
            panelHorario.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));
            panelHorario.Size = new Size(832, 544);
            panelHorario.TabIndex = 1;
            // 
            // lblHorario
            // 
            lblHorario.Dock = DockStyle.Fill;
            lblHorario.Font = new Font("Segoe UI", 14F, FontStyle.Bold);
            lblHorario.Location = new Point(18, 18);
            lblHorario.Margin = new Padding(0);
            lblHorario.Name = "lblHorario";
            lblHorario.Size = new Size(796, 36);
            lblHorario.TabIndex = 0;
            lblHorario.Text = "Horario semanal";
            // 
            // lblDetalleHorario
            // 
            lblDetalleHorario.Dock = DockStyle.Fill;
            lblDetalleHorario.ForeColor = Color.FromArgb(94, 111, 133);
            lblDetalleHorario.Location = new Point(18, 54);
            lblDetalleHorario.Margin = new Padding(0);
            lblDetalleHorario.Name = "lblDetalleHorario";
            lblDetalleHorario.Size = new Size(796, 30);
            lblDetalleHorario.TabIndex = 1;
            lblDetalleHorario.Text = "Sin combinación seleccionada";
            // 
            // panelDesplazamientoHorario
            // 
            panelDesplazamientoHorario.AutoScroll = true;
            panelDesplazamientoHorario.BackColor = Color.White;
            panelDesplazamientoHorario.Controls.Add(tlpHorarioSemanal);
            panelDesplazamientoHorario.Dock = DockStyle.Fill;
            panelDesplazamientoHorario.Location = new Point(18, 84);
            panelDesplazamientoHorario.Margin = new Padding(0);
            panelDesplazamientoHorario.Name = "panelDesplazamientoHorario";
            panelDesplazamientoHorario.Size = new Size(796, 442);
            panelDesplazamientoHorario.TabIndex = 2;
            // 
            // tlpHorarioSemanal
            // 
            tlpHorarioSemanal.AccessibleName = "Horario semanal de lunes a sábado, de 07:00 a 22:00";
            tlpHorarioSemanal.BackColor = Color.White;
            tlpHorarioSemanal.CellBorderStyle = TableLayoutPanelCellBorderStyle.Single;
            tlpHorarioSemanal.ColumnCount = 7;
            tlpHorarioSemanal.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 76F));
            tlpHorarioSemanal.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 16.666666F));
            tlpHorarioSemanal.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 16.666666F));
            tlpHorarioSemanal.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 16.666666F));
            tlpHorarioSemanal.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 16.666666F));
            tlpHorarioSemanal.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 16.666666F));
            tlpHorarioSemanal.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 16.666666F));
            tlpHorarioSemanal.Controls.Add(lblDia0, 0, 0);
            tlpHorarioSemanal.Controls.Add(lblDia1, 1, 0);
            tlpHorarioSemanal.Controls.Add(lblDia2, 2, 0);
            tlpHorarioSemanal.Controls.Add(lblDia3, 3, 0);
            tlpHorarioSemanal.Controls.Add(lblDia4, 4, 0);
            tlpHorarioSemanal.Controls.Add(lblDia5, 5, 0);
            tlpHorarioSemanal.Controls.Add(lblDia6, 6, 0);
            tlpHorarioSemanal.Controls.Add(lblHora7, 0, 1);
            tlpHorarioSemanal.Controls.Add(lblHora8, 0, 2);
            tlpHorarioSemanal.Controls.Add(lblHora9, 0, 3);
            tlpHorarioSemanal.Controls.Add(lblHora10, 0, 4);
            tlpHorarioSemanal.Controls.Add(lblHora11, 0, 5);
            tlpHorarioSemanal.Controls.Add(lblHora12, 0, 6);
            tlpHorarioSemanal.Controls.Add(lblHora13, 0, 7);
            tlpHorarioSemanal.Controls.Add(lblHora14, 0, 8);
            tlpHorarioSemanal.Controls.Add(lblHora15, 0, 9);
            tlpHorarioSemanal.Controls.Add(lblHora16, 0, 10);
            tlpHorarioSemanal.Controls.Add(lblHora17, 0, 11);
            tlpHorarioSemanal.Controls.Add(lblHora18, 0, 12);
            tlpHorarioSemanal.Controls.Add(lblHora19, 0, 13);
            tlpHorarioSemanal.Controls.Add(lblHora20, 0, 14);
            tlpHorarioSemanal.Controls.Add(lblHora21, 0, 15);
            tlpHorarioSemanal.Dock = DockStyle.Top;
            tlpHorarioSemanal.GrowStyle = TableLayoutPanelGrowStyle.FixedSize;
            tlpHorarioSemanal.Location = new Point(0, 0);
            tlpHorarioSemanal.Margin = new Padding(0);
            tlpHorarioSemanal.MinimumSize = new Size(630, 642);
            tlpHorarioSemanal.Name = "tlpHorarioSemanal";
            tlpHorarioSemanal.RowCount = 16;
            tlpHorarioSemanal.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tlpHorarioSemanal.RowStyles.Add(new RowStyle(SizeType.Absolute, 39F));
            tlpHorarioSemanal.RowStyles.Add(new RowStyle(SizeType.Absolute, 39F));
            tlpHorarioSemanal.RowStyles.Add(new RowStyle(SizeType.Absolute, 39F));
            tlpHorarioSemanal.RowStyles.Add(new RowStyle(SizeType.Absolute, 39F));
            tlpHorarioSemanal.RowStyles.Add(new RowStyle(SizeType.Absolute, 39F));
            tlpHorarioSemanal.RowStyles.Add(new RowStyle(SizeType.Absolute, 39F));
            tlpHorarioSemanal.RowStyles.Add(new RowStyle(SizeType.Absolute, 39F));
            tlpHorarioSemanal.RowStyles.Add(new RowStyle(SizeType.Absolute, 39F));
            tlpHorarioSemanal.RowStyles.Add(new RowStyle(SizeType.Absolute, 39F));
            tlpHorarioSemanal.RowStyles.Add(new RowStyle(SizeType.Absolute, 39F));
            tlpHorarioSemanal.RowStyles.Add(new RowStyle(SizeType.Absolute, 39F));
            tlpHorarioSemanal.RowStyles.Add(new RowStyle(SizeType.Absolute, 39F));
            tlpHorarioSemanal.RowStyles.Add(new RowStyle(SizeType.Absolute, 39F));
            tlpHorarioSemanal.RowStyles.Add(new RowStyle(SizeType.Absolute, 39F));
            tlpHorarioSemanal.RowStyles.Add(new RowStyle(SizeType.Absolute, 39F));
            tlpHorarioSemanal.Size = new Size(779, 642);
            tlpHorarioSemanal.TabIndex = 0;
            // 
            // lblDia0
            // 
            lblDia0.BackColor = Color.FromArgb(233, 239, 248);
            lblDia0.Dock = DockStyle.Fill;
            lblDia0.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            lblDia0.ForeColor = Color.FromArgb(24, 43, 73);
            lblDia0.Location = new Point(1, 1);
            lblDia0.Margin = new Padding(0);
            lblDia0.Name = "lblDia0";
            lblDia0.Size = new Size(76, 40);
            lblDia0.TabIndex = 0;
            lblDia0.Text = "Hora";
            lblDia0.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblDia1
            // 
            lblDia1.BackColor = Color.FromArgb(233, 239, 248);
            lblDia1.Dock = DockStyle.Fill;
            lblDia1.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            lblDia1.ForeColor = Color.FromArgb(24, 43, 73);
            lblDia1.Location = new Point(78, 1);
            lblDia1.Margin = new Padding(0);
            lblDia1.Name = "lblDia1";
            lblDia1.Size = new Size(115, 40);
            lblDia1.TabIndex = 1;
            lblDia1.Text = "Lunes";
            lblDia1.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblDia2
            // 
            lblDia2.BackColor = Color.FromArgb(233, 239, 248);
            lblDia2.Dock = DockStyle.Fill;
            lblDia2.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            lblDia2.ForeColor = Color.FromArgb(24, 43, 73);
            lblDia2.Location = new Point(194, 1);
            lblDia2.Margin = new Padding(0);
            lblDia2.Name = "lblDia2";
            lblDia2.Size = new Size(115, 40);
            lblDia2.TabIndex = 2;
            lblDia2.Text = "Martes";
            lblDia2.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblDia3
            // 
            lblDia3.BackColor = Color.FromArgb(233, 239, 248);
            lblDia3.Dock = DockStyle.Fill;
            lblDia3.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            lblDia3.ForeColor = Color.FromArgb(24, 43, 73);
            lblDia3.Location = new Point(310, 1);
            lblDia3.Margin = new Padding(0);
            lblDia3.Name = "lblDia3";
            lblDia3.Size = new Size(115, 40);
            lblDia3.TabIndex = 3;
            lblDia3.Text = "Miércoles";
            lblDia3.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblDia4
            // 
            lblDia4.BackColor = Color.FromArgb(233, 239, 248);
            lblDia4.Dock = DockStyle.Fill;
            lblDia4.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            lblDia4.ForeColor = Color.FromArgb(24, 43, 73);
            lblDia4.Location = new Point(426, 1);
            lblDia4.Margin = new Padding(0);
            lblDia4.Name = "lblDia4";
            lblDia4.Size = new Size(115, 40);
            lblDia4.TabIndex = 4;
            lblDia4.Text = "Jueves";
            lblDia4.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblDia5
            // 
            lblDia5.BackColor = Color.FromArgb(233, 239, 248);
            lblDia5.Dock = DockStyle.Fill;
            lblDia5.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            lblDia5.ForeColor = Color.FromArgb(24, 43, 73);
            lblDia5.Location = new Point(542, 1);
            lblDia5.Margin = new Padding(0);
            lblDia5.Name = "lblDia5";
            lblDia5.Size = new Size(115, 40);
            lblDia5.TabIndex = 5;
            lblDia5.Text = "Viernes";
            lblDia5.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblDia6
            // 
            lblDia6.BackColor = Color.FromArgb(233, 239, 248);
            lblDia6.Dock = DockStyle.Fill;
            lblDia6.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            lblDia6.ForeColor = Color.FromArgb(24, 43, 73);
            lblDia6.Location = new Point(658, 1);
            lblDia6.Margin = new Padding(0);
            lblDia6.Name = "lblDia6";
            lblDia6.Size = new Size(120, 40);
            lblDia6.TabIndex = 6;
            lblDia6.Text = "Sábado";
            lblDia6.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblHora7
            // 
            lblHora7.BackColor = Color.FromArgb(247, 249, 252);
            lblHora7.Dock = DockStyle.Fill;
            lblHora7.Font = new Font("Segoe UI", 8F);
            lblHora7.ForeColor = Color.FromArgb(94, 111, 133);
            lblHora7.Location = new Point(1, 42);
            lblHora7.Margin = new Padding(0);
            lblHora7.Name = "lblHora7";
            lblHora7.Size = new Size(76, 39);
            lblHora7.TabIndex = 7;
            lblHora7.Text = "07:00\r\n08:00";
            lblHora7.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblHora8
            // 
            lblHora8.BackColor = Color.FromArgb(247, 249, 252);
            lblHora8.Dock = DockStyle.Fill;
            lblHora8.Font = new Font("Segoe UI", 8F);
            lblHora8.ForeColor = Color.FromArgb(94, 111, 133);
            lblHora8.Location = new Point(1, 82);
            lblHora8.Margin = new Padding(0);
            lblHora8.Name = "lblHora8";
            lblHora8.Size = new Size(76, 39);
            lblHora8.TabIndex = 8;
            lblHora8.Text = "08:00\r\n09:00";
            lblHora8.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblHora9
            // 
            lblHora9.BackColor = Color.FromArgb(247, 249, 252);
            lblHora9.Dock = DockStyle.Fill;
            lblHora9.Font = new Font("Segoe UI", 8F);
            lblHora9.ForeColor = Color.FromArgb(94, 111, 133);
            lblHora9.Location = new Point(1, 122);
            lblHora9.Margin = new Padding(0);
            lblHora9.Name = "lblHora9";
            lblHora9.Size = new Size(76, 39);
            lblHora9.TabIndex = 9;
            lblHora9.Text = "09:00\r\n10:00";
            lblHora9.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblHora10
            // 
            lblHora10.BackColor = Color.FromArgb(247, 249, 252);
            lblHora10.Dock = DockStyle.Fill;
            lblHora10.Font = new Font("Segoe UI", 8F);
            lblHora10.ForeColor = Color.FromArgb(94, 111, 133);
            lblHora10.Location = new Point(1, 162);
            lblHora10.Margin = new Padding(0);
            lblHora10.Name = "lblHora10";
            lblHora10.Size = new Size(76, 39);
            lblHora10.TabIndex = 10;
            lblHora10.Text = "10:00\r\n11:00";
            lblHora10.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblHora11
            // 
            lblHora11.BackColor = Color.FromArgb(247, 249, 252);
            lblHora11.Dock = DockStyle.Fill;
            lblHora11.Font = new Font("Segoe UI", 8F);
            lblHora11.ForeColor = Color.FromArgb(94, 111, 133);
            lblHora11.Location = new Point(1, 202);
            lblHora11.Margin = new Padding(0);
            lblHora11.Name = "lblHora11";
            lblHora11.Size = new Size(76, 39);
            lblHora11.TabIndex = 11;
            lblHora11.Text = "11:00\r\n12:00";
            lblHora11.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblHora12
            // 
            lblHora12.BackColor = Color.FromArgb(247, 249, 252);
            lblHora12.Dock = DockStyle.Fill;
            lblHora12.Font = new Font("Segoe UI", 8F);
            lblHora12.ForeColor = Color.FromArgb(94, 111, 133);
            lblHora12.Location = new Point(1, 242);
            lblHora12.Margin = new Padding(0);
            lblHora12.Name = "lblHora12";
            lblHora12.Size = new Size(76, 39);
            lblHora12.TabIndex = 12;
            lblHora12.Text = "12:00\r\n13:00";
            lblHora12.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblHora13
            // 
            lblHora13.BackColor = Color.FromArgb(247, 249, 252);
            lblHora13.Dock = DockStyle.Fill;
            lblHora13.Font = new Font("Segoe UI", 8F);
            lblHora13.ForeColor = Color.FromArgb(94, 111, 133);
            lblHora13.Location = new Point(1, 282);
            lblHora13.Margin = new Padding(0);
            lblHora13.Name = "lblHora13";
            lblHora13.Size = new Size(76, 39);
            lblHora13.TabIndex = 13;
            lblHora13.Text = "13:00\r\n14:00";
            lblHora13.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblHora14
            // 
            lblHora14.BackColor = Color.FromArgb(247, 249, 252);
            lblHora14.Dock = DockStyle.Fill;
            lblHora14.Font = new Font("Segoe UI", 8F);
            lblHora14.ForeColor = Color.FromArgb(94, 111, 133);
            lblHora14.Location = new Point(1, 322);
            lblHora14.Margin = new Padding(0);
            lblHora14.Name = "lblHora14";
            lblHora14.Size = new Size(76, 39);
            lblHora14.TabIndex = 14;
            lblHora14.Text = "14:00\r\n15:00";
            lblHora14.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblHora15
            // 
            lblHora15.BackColor = Color.FromArgb(247, 249, 252);
            lblHora15.Dock = DockStyle.Fill;
            lblHora15.Font = new Font("Segoe UI", 8F);
            lblHora15.ForeColor = Color.FromArgb(94, 111, 133);
            lblHora15.Location = new Point(1, 362);
            lblHora15.Margin = new Padding(0);
            lblHora15.Name = "lblHora15";
            lblHora15.Size = new Size(76, 39);
            lblHora15.TabIndex = 15;
            lblHora15.Text = "15:00\r\n16:00";
            lblHora15.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblHora16
            // 
            lblHora16.BackColor = Color.FromArgb(247, 249, 252);
            lblHora16.Dock = DockStyle.Fill;
            lblHora16.Font = new Font("Segoe UI", 8F);
            lblHora16.ForeColor = Color.FromArgb(94, 111, 133);
            lblHora16.Location = new Point(1, 402);
            lblHora16.Margin = new Padding(0);
            lblHora16.Name = "lblHora16";
            lblHora16.Size = new Size(76, 39);
            lblHora16.TabIndex = 16;
            lblHora16.Text = "16:00\r\n17:00";
            lblHora16.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblHora17
            // 
            lblHora17.BackColor = Color.FromArgb(247, 249, 252);
            lblHora17.Dock = DockStyle.Fill;
            lblHora17.Font = new Font("Segoe UI", 8F);
            lblHora17.ForeColor = Color.FromArgb(94, 111, 133);
            lblHora17.Location = new Point(1, 442);
            lblHora17.Margin = new Padding(0);
            lblHora17.Name = "lblHora17";
            lblHora17.Size = new Size(76, 39);
            lblHora17.TabIndex = 17;
            lblHora17.Text = "17:00\r\n18:00";
            lblHora17.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblHora18
            // 
            lblHora18.BackColor = Color.FromArgb(247, 249, 252);
            lblHora18.Dock = DockStyle.Fill;
            lblHora18.Font = new Font("Segoe UI", 8F);
            lblHora18.ForeColor = Color.FromArgb(94, 111, 133);
            lblHora18.Location = new Point(1, 482);
            lblHora18.Margin = new Padding(0);
            lblHora18.Name = "lblHora18";
            lblHora18.Size = new Size(76, 39);
            lblHora18.TabIndex = 18;
            lblHora18.Text = "18:00\r\n19:00";
            lblHora18.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblHora19
            // 
            lblHora19.BackColor = Color.FromArgb(247, 249, 252);
            lblHora19.Dock = DockStyle.Fill;
            lblHora19.Font = new Font("Segoe UI", 8F);
            lblHora19.ForeColor = Color.FromArgb(94, 111, 133);
            lblHora19.Location = new Point(1, 522);
            lblHora19.Margin = new Padding(0);
            lblHora19.Name = "lblHora19";
            lblHora19.Size = new Size(76, 39);
            lblHora19.TabIndex = 19;
            lblHora19.Text = "19:00\r\n20:00";
            lblHora19.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblHora20
            // 
            lblHora20.BackColor = Color.FromArgb(247, 249, 252);
            lblHora20.Dock = DockStyle.Fill;
            lblHora20.Font = new Font("Segoe UI", 8F);
            lblHora20.ForeColor = Color.FromArgb(94, 111, 133);
            lblHora20.Location = new Point(1, 562);
            lblHora20.Margin = new Padding(0);
            lblHora20.Name = "lblHora20";
            lblHora20.Size = new Size(76, 39);
            lblHora20.TabIndex = 20;
            lblHora20.Text = "20:00\r\n21:00";
            lblHora20.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // lblHora21
            // 
            lblHora21.BackColor = Color.FromArgb(247, 249, 252);
            lblHora21.Dock = DockStyle.Fill;
            lblHora21.Font = new Font("Segoe UI", 8F);
            lblHora21.ForeColor = Color.FromArgb(94, 111, 133);
            lblHora21.Location = new Point(1, 602);
            lblHora21.Margin = new Padding(0);
            lblHora21.Name = "lblHora21";
            lblHora21.Size = new Size(76, 39);
            lblHora21.TabIndex = 21;
            lblHora21.Text = "21:00\r\n22:00";
            lblHora21.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // panelInferior
            // 
            panelInferior.BackColor = Color.White;
            panelInferior.ColumnCount = 3;
            panelInferior.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 170F));
            panelInferior.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 220F));
            panelInferior.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100F));
            panelInferior.Controls.Add(panelCreditos, 0, 0);
            panelInferior.Controls.Add(panelValidez, 1, 0);
            panelInferior.Controls.Add(panelMotivo, 2, 0);
            panelInferior.Dock = DockStyle.Fill;
            panelInferior.Location = new Point(0, 676);
            panelInferior.Margin = new Padding(0);
            panelInferior.Name = "panelInferior";
            panelInferior.Padding = new Padding(24, 16, 24, 16);
            panelInferior.RowCount = 1;
            panelInferior.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));
            panelInferior.Size = new Size(1160, 104);
            panelInferior.TabIndex = 2;
            // 
            // panelCreditos
            // 
            panelCreditos.Controls.Add(lblCreditosTotales);
            panelCreditos.Controls.Add(lblCreditosTitulo);
            panelCreditos.Dock = DockStyle.Fill;
            panelCreditos.Location = new Point(24, 16);
            panelCreditos.Margin = new Padding(0, 0, 16, 0);
            panelCreditos.Name = "panelCreditos";
            panelCreditos.Size = new Size(154, 72);
            panelCreditos.TabIndex = 0;
            // 
            // lblCreditosTotales
            // 
            lblCreditosTotales.AutoEllipsis = true;
            lblCreditosTotales.Dock = DockStyle.Fill;
            lblCreditosTotales.Font = new Font("Segoe UI", 20F, FontStyle.Bold);
            lblCreditosTotales.ForeColor = Color.FromArgb(24, 43, 73);
            lblCreditosTotales.Location = new Point(0, 24);
            lblCreditosTotales.Name = "lblCreditosTotales";
            lblCreditosTotales.Padding = new Padding(0, 4, 0, 0);
            lblCreditosTotales.Size = new Size(154, 48);
            lblCreditosTotales.TabIndex = 0;
            lblCreditosTotales.Text = "—";
            // 
            // lblCreditosTitulo
            // 
            lblCreditosTitulo.Dock = DockStyle.Top;
            lblCreditosTitulo.ForeColor = Color.FromArgb(94, 111, 133);
            lblCreditosTitulo.Location = new Point(0, 0);
            lblCreditosTitulo.Name = "lblCreditosTitulo";
            lblCreditosTitulo.Size = new Size(154, 24);
            lblCreditosTitulo.TabIndex = 1;
            lblCreditosTitulo.Text = "Créditos totales";
            // 
            // panelValidez
            // 
            panelValidez.Controls.Add(lblEstadoCombinacion);
            panelValidez.Controls.Add(lblValidezTitulo);
            panelValidez.Dock = DockStyle.Fill;
            panelValidez.Location = new Point(194, 16);
            panelValidez.Margin = new Padding(0, 0, 16, 0);
            panelValidez.Name = "panelValidez";
            panelValidez.Size = new Size(204, 72);
            panelValidez.TabIndex = 1;
            // 
            // lblEstadoCombinacion
            // 
            lblEstadoCombinacion.AutoEllipsis = true;
            lblEstadoCombinacion.Dock = DockStyle.Fill;
            lblEstadoCombinacion.Font = new Font("Segoe UI", 12F, FontStyle.Bold);
            lblEstadoCombinacion.ForeColor = Color.FromArgb(24, 43, 73);
            lblEstadoCombinacion.Location = new Point(0, 24);
            lblEstadoCombinacion.Name = "lblEstadoCombinacion";
            lblEstadoCombinacion.Padding = new Padding(0, 4, 0, 0);
            lblEstadoCombinacion.Size = new Size(204, 48);
            lblEstadoCombinacion.TabIndex = 0;
            lblEstadoCombinacion.Text = "Sin evaluar";
            // 
            // lblValidezTitulo
            // 
            lblValidezTitulo.Dock = DockStyle.Top;
            lblValidezTitulo.ForeColor = Color.FromArgb(94, 111, 133);
            lblValidezTitulo.Location = new Point(0, 0);
            lblValidezTitulo.Name = "lblValidezTitulo";
            lblValidezTitulo.Size = new Size(204, 24);
            lblValidezTitulo.TabIndex = 1;
            lblValidezTitulo.Text = "Estado de la combinación";
            // 
            // panelMotivo
            // 
            panelMotivo.Controls.Add(lblMotivoRechazo);
            panelMotivo.Controls.Add(lblMotivoTitulo);
            panelMotivo.Dock = DockStyle.Fill;
            panelMotivo.Location = new Point(414, 16);
            panelMotivo.Margin = new Padding(0, 0, 16, 0);
            panelMotivo.Name = "panelMotivo";
            panelMotivo.Size = new Size(706, 72);
            panelMotivo.TabIndex = 2;
            // 
            // lblMotivoRechazo
            // 
            lblMotivoRechazo.AutoEllipsis = true;
            lblMotivoRechazo.Dock = DockStyle.Fill;
            lblMotivoRechazo.Font = new Font("Segoe UI", 9F);
            lblMotivoRechazo.ForeColor = Color.FromArgb(24, 43, 73);
            lblMotivoRechazo.Location = new Point(0, 24);
            lblMotivoRechazo.Name = "lblMotivoRechazo";
            lblMotivoRechazo.Padding = new Padding(0, 4, 0, 0);
            lblMotivoRechazo.Size = new Size(706, 48);
            lblMotivoRechazo.TabIndex = 0;
            lblMotivoRechazo.Text = "Selecciona una combinación para consultar su estado.";
            // 
            // lblMotivoTitulo
            // 
            lblMotivoTitulo.Dock = DockStyle.Top;
            lblMotivoTitulo.ForeColor = Color.FromArgb(94, 111, 133);
            lblMotivoTitulo.Location = new Point(0, 0);
            lblMotivoTitulo.Name = "lblMotivoTitulo";
            lblMotivoTitulo.Size = new Size(706, 24);
            lblMotivoTitulo.TabIndex = 1;
            lblMotivoTitulo.Text = "Motivo de rechazo";
            // 
            // CEmestre
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1160, 780);
            Controls.Add(layoutPrincipal);
            Font = new Font("Segoe UI", 9F);
            ForeColor = Color.FromArgb(24, 43, 73);
            MinimumSize = new Size(1020, 640);
            Name = "CEmestre";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "CEmestre";
            layoutPrincipal.ResumeLayout(false);
            panelSuperior.ResumeLayout(false);
            panelSuperior.PerformLayout();
            layoutContenido.ResumeLayout(false);
            panelCombinaciones.ResumeLayout(false);
            panelHorario.ResumeLayout(false);
            panelDesplazamientoHorario.ResumeLayout(false);
            tlpHorarioSemanal.ResumeLayout(false);
            panelInferior.ResumeLayout(false);
            panelCreditos.ResumeLayout(false);
            panelValidez.ResumeLayout(false);
            panelMotivo.ResumeLayout(false);
            ResumeLayout(false);
        }

        #endregion

        private TableLayoutPanel layoutPrincipal;
        private Panel panelSuperior;
        private Label lblTitulo;
        private Button btnCargarArchivos;
        private TableLayoutPanel layoutContenido;
        private TableLayoutPanel panelCombinaciones;
        private Label lblCombinaciones;
        private Label lblCriterio;
        private ComboBox cmbCriterio;
        private ListBox lstCombinaciones;
        private Label lblAyudaCombinaciones;
        private TableLayoutPanel panelHorario;
        private Label lblHorario;
        private Label lblDetalleHorario;
        private Panel panelDesplazamientoHorario;
        private TableLayoutPanel tlpHorarioSemanal;
        private TableLayoutPanel panelInferior;
        private Panel panelCreditos;
        private Label lblCreditosTitulo;
        private Label lblCreditosTotales;
        private Panel panelValidez;
        private Label lblValidezTitulo;
        private Label lblEstadoCombinacion;
        private Panel panelMotivo;
        private Label lblMotivoTitulo;
        private Label lblMotivoRechazo;
        private Label lblDia0;
        private Label lblDia1;
        private Label lblDia2;
        private Label lblDia3;
        private Label lblDia4;
        private Label lblDia5;
        private Label lblDia6;
        private Label lblHora7;
        private Label lblHora8;
        private Label lblHora9;
        private Label lblHora10;
        private Label lblHora11;
        private Label lblHora12;
        private Label lblHora13;
        private Label lblHora14;
        private Label lblHora15;
        private Label lblHora16;
        private Label lblHora17;
        private Label lblHora18;
        private Label lblHora19;
        private Label lblHora20;
        private Label lblHora21;
    }
}
