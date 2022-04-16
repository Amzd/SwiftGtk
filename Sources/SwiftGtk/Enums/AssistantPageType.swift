import CGtk

/// An enum for determining the page role inside the `GtkAssistant`. It’s used to handle buttons sensitivity and visibility.
///
/// Note that an assistant needs to end its page flow with a page of type `GTK_ASSISTANT_PAGE_CONFIRM`, `GTK_ASSISTANT_PAGE_SUMMARY` or `GTK_ASSISTANT_PAGE_PROGRESS` to be correct.
///
/// The Cancel button will only be shown if the page isn’t “committed”. See `gtk_assistant_commit()` for details.
///
/// [Gtk docs](https://docs.gtk.org/gtk3/enum.AssistantPageType.html)
public enum AssistantPageType {
    /// The page has regular contents. Both the Back and forward buttons will be shown.
    case content
    /// The page contains an introduction to the assistant task. Only the Forward button will be shown if there is a next page.
    case intro
    /// The page lets the user confirm or deny the changes. The Back and Apply buttons will be shown.
    case confirm
    /// The page informs the user of the changes done. Only the Close button will be shown.
    case summary
    /// Used for tasks that take a long time to complete, blocks the assistant until the page is marked as complete. Only the back button will be shown.
    case progress
    /// Used for when other page types are not appropriate. No buttons will be shown, and the application must add its own buttons through gtk_assistant_add_action_widget().
    case custom

    func toGtkAssistantPageType() -> GtkAssistantPageType {
        switch self {
        case .content:
            return GTK_ASSISTANT_PAGE_CONTENT
        case .intro:
            return GTK_ASSISTANT_PAGE_INTRO
        case .confirm:
            return GTK_ASSISTANT_PAGE_CONFIRM
        case .summary:
            return GTK_ASSISTANT_PAGE_SUMMARY
        case .progress:
            return GTK_ASSISTANT_PAGE_PROGRESS
        case .custom:
            return GTK_ASSISTANT_PAGE_CUSTOM
        }
    }
}

extension GtkAssistantPageType {
    func toAssistantPageType() -> AssistantPageType {
        switch self {
        case GTK_ASSISTANT_PAGE_CONTENT:
            return .content
        case GTK_ASSISTANT_PAGE_INTRO:
            return .intro
        case GTK_ASSISTANT_PAGE_CONFIRM:
            return .confirm
        case GTK_ASSISTANT_PAGE_SUMMARY:
            return .summary
        case GTK_ASSISTANT_PAGE_PROGRESS:
            return .progress
        case GTK_ASSISTANT_PAGE_CUSTOM:
            return .custom
        default:
            fatalError("Unsupported GtkAssistantPageType enum value: \(self.rawValue)")
        }
    }
}
