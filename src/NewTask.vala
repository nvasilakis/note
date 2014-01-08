using Granite.Widgets;

namespace Note{
	public class NewTask : LightWindow {
		Gtk.Grid grid;
		HintedEntry what;
		DatePicker when_date;
		TimePicker when_time;
		Gtk.TextView notes;
		Gtk.ScrolledWindow scrolled;

		public NewTask() {
			base("New Task");
            title = "Add a task!";
            resizable = false;
            set_keep_above (true);
            window_position = Gtk.WindowPosition.CENTER;
			set_default_size(400,500);
			set_size_request (100,200);

			grid =  new Gtk.Grid ();
            grid.margin_left = 12;
            grid.margin_right = 12;
            grid.margin_top = 12;
            grid.margin_bottom = 12;
            grid.set_row_spacing (6);
            grid.set_column_spacing (12);

            Gtk.Grid subgrid = new Gtk.Grid ();
//            subgrid.set_sensitive (can_edit);
            subgrid.margin_left = 0;
            subgrid.margin_right = 0;
            subgrid.margin_top = 0;
            subgrid.margin_bottom = 0;
            subgrid.set_row_spacing (4);
            subgrid.set_column_spacing (8);

            var what_label = make_label ("What:");
			what = new Granite.Widgets.HintedEntry (Utils.INIT_TEXT);

            var when_label = make_label ("When:");
            when_date = make_date_picker ();
            when_time = make_time_picker ();

            var note_label = make_label ("Notes:");
            notes = new Gtk.TextView ();
            notes.set_wrap_mode (Gtk.WrapMode.WORD_CHAR);

            var scrolled = new Gtk.ScrolledWindow (null, null);
            scrolled.add (notes);
            scrolled.height_request = 100;
            scrolled.set_vexpand(true);
            scrolled.set_hexpand(true);

            subgrid.attach (what_label, 0, 0, 2, 1);
            subgrid.attach (what, 0, 1, 2, 1);
            subgrid.attach (when_label, 0, 2, 2, 1);
            subgrid.attach (when_date, 0, 3, 1, 1);
            subgrid.attach (when_time, 1, 3, 1, 1);
            subgrid.attach (note_label, 0, 4, 2, 1);
			subgrid.attach (scrolled, 0, 5, 2, 1);

			var buttonbox = new Gtk.ButtonBox (Gtk.Orientation.HORIZONTAL);
            buttonbox.set_layout (Gtk.ButtonBoxStyle.END);

            var cancel_button = new Gtk.Button.with_label ("Cancel");
			var create_button = new Gtk.Button.with_label ("Add");

            buttonbox.pack_end (cancel_button);
            buttonbox.pack_end (create_button);
            create_button.margin_right = 5;
            grid.attach (subgrid, 0, 0, 1, 1);
            grid.attach (buttonbox, 0, 1, 1, 1);
			add (grid);
		}

        Gtk.Label make_label (string text) {
            var label = new Gtk.Label ("<span weight='bold'>"+text+"</span>");
            label.use_markup = true;
            label.set_alignment (0.0f, 0.5f);
            return label;
        }

        DatePicker make_date_picker () {
            var date_picker = new DatePicker.with_format ("%B %e, %Y");
            date_picker.width_request = 200;
            return date_picker;
        }

        TimePicker make_time_picker () {
            var time_picker = new TimePicker.with_format ("%l:%M %p");
            time_picker.width_request = 120;
            return time_picker;
        }
	}

	public class ErrorDialog : Gtk.MessageDialog {
		public ErrorDialog (string title, string message) {
/*			var msg = new Gtk.MessageDialog (null, Gtk.DialogFlags.MODAL,
				 Gtk.MessageType.Error,
				 Gtk.ButtonsType.OK,
				 message);
			msg.response.connect ((response_id) => { msg.destroy(); });
			msg.show();
*/
		}
	}
}