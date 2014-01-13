namespace Note {

	public class Utils {
		//application constants
		public const string INIT_TEXT = "Breakfast at Milliway's at 7am";
        public const string TOOLTIP_TEXT = "Add Task";
		public const string ICON = "text-richtext";

		//boot params
		public static bool DEBUG = false;

        // Option parameters
        public static bool intrusive_notifications = false;
        public static bool ask_delete_confirmation = false;

		public static const OptionEntry[] args = {
            { "debug",'d', 0, OptionArg.NONE, out Utils.DEBUG,
			  "Enable debug logging", null },
            { null } //list terminator
        };
	}
}