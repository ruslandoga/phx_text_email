defmodule EmailWeb.Email do
  import Bamboo.Email

  def mailer_email_from do
    {"Plausible", "plausible@example.com"}
  end

  def activation_email(user, code) do
    priority_email()
    |> to(user)
    |> subject("#{code} is your Plausible email verification code")
    |> render("activation_email.html", user: user, code: code)
  end

  def welcome_email(user) do
    base_email()
    |> to(user)
    |> subject("Welcome to Plausible")
    |> render("welcome_email.html", user: user)
  end

  # def create_site_email(user) do
  #   base_email()
  #   |> to(user)
  #   |> subject("Your Plausible setup: Add your website details")
  #   |> render("create_site_email.html", user: user)
  # end

  # def site_setup_help(user, site) do
  #   base_email()
  #   |> to(user)
  #   |> subject("Your Plausible setup: Waiting for the first page views")
  #   |> render("site_setup_help_email.html",
  #     user: user,
  #     site: site
  #   )
  # end

  # def site_setup_success(user, site) do
  #   base_email()
  #   |> to(user)
  #   |> tag("setup-success-email")
  #   |> subject("Plausible is now tracking your website stats")
  #   |> render("site_setup_success_email.html",
  #     user: user,
  #     site: site
  #   )
  # end

  # def check_stats_email(user) do
  #   base_email()
  #   |> to(user)
  #   |> tag("check-stats-email")
  #   |> subject("Check your Plausible website stats")
  #   |> render("check_stats_email.html", user: user)
  # end

  # def password_reset_email(email, reset_link) do
  #   priority_email(%{layout: nil})
  #   |> to(email)
  #   |> tag("password-reset-email")
  #   |> subject("Plausible password reset")
  #   |> render("password_reset_email.html", reset_link: reset_link)
  # end

  # def two_factor_enabled_email(user) do
  #   priority_email()
  #   |> to(user)
  #   |> tag("two-factor-enabled-email")
  #   |> subject("Plausible Two-Factor Authentication enabled")
  #   |> render("two_factor_enabled_email.html", user: user)
  # end

  # def two_factor_disabled_email(user) do
  #   priority_email()
  #   |> to(user)
  #   |> tag("two-factor-disabled-email")
  #   |> subject("Plausible Two-Factor Authentication disabled")
  #   |> render("two_factor_disabled_email.html", user: user)
  # end

  # def trial_one_week_reminder(user) do
  #   base_email()
  #   |> to(user)
  #   |> tag("trial-one-week-reminder")
  #   |> subject("Your Plausible trial expires next week")
  #   |> render("trial_one_week_reminder.html", user: user)
  # end

  # def trial_upgrade_email(user, day, usage) do
  #   team =
  #     case Plausible.Teams.get_by_owner(user) do
  #       {:ok, team} -> team
  #       _ -> nil
  #     end

  #   suggested_plan = Plausible.Billing.Plans.suggest(team, usage.total)

  #   base_email()
  #   |> to(user)
  #   |> tag("trial-upgrade-email")
  #   |> subject("Your Plausible trial ends #{day}")
  #   |> render("trial_upgrade_email.html",
  #     user: user,
  #     day: day,
  #     custom_events: usage.custom_events,
  #     usage: usage.total,
  #     suggested_plan: suggested_plan
  #   )
  # end

  # def trial_over_email(user) do
  #   base_email()
  #   |> to(user)
  #   |> tag("trial-over-email")
  #   |> subject("Your Plausible trial has ended")
  #   |> render("trial_over_email.html",
  #     user: user,
  #     extra_offset: Plausible.Auth.User.trial_accept_traffic_until_offset_days()
  #   )
  # end

  # def stats_report(email, assigns) do
  #   base_email(%{layout: nil})
  #   |> to(email)
  #   |> tag("#{assigns.type}-report")
  #   |> subject("#{assigns.name} report for #{assigns.site.domain}")
  #   |> html_body(PlausibleWeb.MJML.StatsReport.render(assigns))
  # end

  # def spike_notification(email, site, current_visitors, sources, dashboard_link) do
  #   base_email()
  #   |> to(email)
  #   |> tag("spike-notification")
  #   |> subject("Traffic Spike on #{site.domain}")
  #   |> render("spike_notification.html", %{
  #     site: site,
  #     current_visitors: current_visitors,
  #     sources: sources,
  #     link: dashboard_link
  #   })
  # end

  # def drop_notification(email, site, current_visitors, dashboard_link, installation_link) do
  #   base_email()
  #   |> to(email)
  #   |> tag("drop-notification")
  #   |> subject("Traffic Drop on #{site.domain}")
  #   |> render("drop_notification.html", %{
  #     site: site,
  #     current_visitors: current_visitors,
  #     dashboard_link: dashboard_link,
  #     installation_link: installation_link
  #   })
  # end

  # def over_limit_email(user, usage, suggested_plan) do
  #   priority_email()
  #   |> to(user)
  #   |> tag("over-limit")
  #   |> subject("[Action required] You have outgrown your Plausible subscription tier")
  #   |> render("over_limit.html", %{
  #     user: user,
  #     usage: usage,
  #     suggested_plan: suggested_plan
  #   })
  # end

  # def enterprise_over_limit_internal_email(user, pageview_usage, site_usage, site_allowance) do
  #   base_email(%{layout: nil})
  #   |> to("enterprise@plausible.io")
  #   |> tag("enterprise-over-limit")
  #   |> subject("#{user.email} has outgrown their enterprise plan")
  #   |> render("enterprise_over_limit_internal.html", %{
  #     user: user,
  #     pageview_usage: pageview_usage,
  #     site_usage: site_usage,
  #     site_allowance: site_allowance
  #   })
  # end

  # def dashboard_locked(user, usage, suggested_plan) do
  #   priority_email()
  #   |> to(user)
  #   |> tag("dashboard-locked")
  #   |> subject("[Action required] Your Plausible dashboard is now locked")
  #   |> render("dashboard_locked.html", %{
  #     user: user,
  #     usage: usage,
  #     suggested_plan: suggested_plan
  #   })
  # end

  # def yearly_renewal_notification(user) do
  #   date = Calendar.strftime(user.subscription.next_bill_date, "%B %-d, %Y")

  #   priority_email()
  #   |> to(user)
  #   |> tag("yearly-renewal")
  #   |> subject("Your Plausible subscription is up for renewal")
  #   |> render("yearly_renewal_notification.html", %{
  #     user: user,
  #     date: date,
  #     next_bill_amount: user.subscription.next_bill_amount,
  #     currency: user.subscription.currency_code
  #   })
  # end

  # def yearly_expiration_notification(user) do
  #   next_bill_date = Calendar.strftime(user.subscription.next_bill_date, "%B %-d, %Y")

  #   accept_traffic_until =
  #     user
  #     |> Plausible.Users.accept_traffic_until()
  #     |> Calendar.strftime("%B %-d, %Y")

  #   priority_email()
  #   |> to(user)
  #   |> tag("yearly-expiration")
  #   |> subject("Your Plausible subscription is about to expire")
  #   |> render("yearly_expiration_notification.html", %{
  #     user: user,
  #     next_bill_date: next_bill_date,
  #     accept_traffic_until: accept_traffic_until
  #   })
  # end

  # def cancellation_email(user) do
  #   base_email()
  #   |> to(user.email)
  #   |> tag("cancelled-email")
  #   |> subject("Mind sharing your thoughts on Plausible?")
  #   |> render("cancellation_email.html", user: user)
  # end

  # def new_user_invitation(email, invitation_id, site, inviter) do
  #   priority_email()
  #   |> to(email)
  #   |> tag("new-user-invitation")
  #   |> subject("[#{Plausible.product_name()}] You've been invited to #{site.domain}")
  #   |> render("new_user_invitation.html",
  #     invitation_id: invitation_id,
  #     site: site,
  #     inviter: inviter
  #   )
  # end

  # def existing_user_invitation(email, site, inviter) do
  #   priority_email()
  #   |> to(email)
  #   |> tag("existing-user-invitation")
  #   |> subject("[#{Plausible.product_name()}] You've been invited to #{site.domain}")
  #   |> render("existing_user_invitation.html",
  #     site: site,
  #     inviter: inviter
  #   )
  # end

  # def ownership_transfer_request(email, invitation_id, site, inviter, new_owner_account) do
  #   priority_email()
  #   |> to(email)
  #   |> tag("ownership-transfer-request")
  #   |> subject("[#{Plausible.product_name()}] Request to transfer ownership of #{site.domain}")
  #   |> render("ownership_transfer_request.html",
  #     invitation_id: invitation_id,
  #     inviter: inviter,
  #     site: site,
  #     new_owner_account: new_owner_account
  #   )
  # end

  # def invitation_accepted(inviter_email, invitee_email, site) do
  #   priority_email()
  #   |> to(inviter_email)
  #   |> tag("invitation-accepted")
  #   |> subject(
  #     "[#{Plausible.product_name()}] #{invitee_email} accepted your invitation to #{site.domain}"
  #   )
  #   |> render("invitation_accepted.html",
  #     invitee_email: invitee_email,
  #     site: site
  #   )
  # end

  # def invitation_rejected(invitation) do
  #   priority_email()
  #   |> to(invitation.inviter.email)
  #   |> tag("invitation-rejected")
  #   |> subject(
  #     "[#{Plausible.product_name()}] #{invitation.email} rejected your invitation to #{invitation.site.domain}"
  #   )
  #   |> render("invitation_rejected.html",
  #     user: invitation.inviter,
  #     invitation: invitation
  #   )
  # end

  # def ownership_transfer_accepted(new_owner_email, inviter_email, site) do
  #   priority_email()
  #   |> to(inviter_email)
  #   |> tag("ownership-transfer-accepted")
  #   |> subject(
  #     "[#{Plausible.product_name()}] #{new_owner_email} accepted the ownership transfer of #{site.domain}"
  #   )
  #   |> render("ownership_transfer_accepted.html",
  #     new_owner_email: new_owner_email,
  #     site: site
  #   )
  # end

  # def ownership_transfer_rejected(invitation) do
  #   priority_email()
  #   |> to(invitation.inviter.email)
  #   |> tag("ownership-transfer-rejected")
  #   |> subject(
  #     "[#{Plausible.product_name()}] #{invitation.email} rejected the ownership transfer of #{invitation.site.domain}"
  #   )
  #   |> render("ownership_transfer_rejected.html",
  #     user: invitation.inviter,
  #     invitation: invitation
  #   )
  # end

  # def site_member_removed(membership) do
  #   priority_email()
  #   |> to(membership.user.email)
  #   |> tag("site-member-removed")
  #   |> subject(
  #     "[#{Plausible.product_name()}] Your access to #{membership.site.domain} has been revoked"
  #   )
  #   |> render("site_member_removed.html",
  #     user: membership.user,
  #     membership: membership
  #   )
  # end

  # def import_success(site_import, user) do
  #   import_api = Plausible.Imported.ImportSources.by_name(site_import.source)
  #   label = import_api.label()

  #   priority_email()
  #   |> to(user)
  #   |> tag("import-success-email")
  #   |> subject("#{label} data imported for #{site_import.site.domain}")
  #   |> render(import_api.email_template(), %{
  #     site_import: site_import,
  #     label: label,
  #     link: PlausibleWeb.Endpoint.url() <> "/" <> URI.encode_www_form(site_import.site.domain),
  #     user: user,
  #     success: true
  #   })
  # end

  # def import_failure(site_import, user) do
  #   import_api = Plausible.Imported.ImportSources.by_name(site_import.source)
  #   label = import_api.label()

  #   priority_email()
  #   |> to(user)
  #   |> tag("import-failure-email")
  #   |> subject("#{label} import failed for #{site_import.site.domain}")
  #   |> render(import_api.email_template(), %{
  #     site_import: site_import,
  #     label: label,
  #     user: user,
  #     success: false
  #   })
  # end

  # def export_success(user, site, expires_at) do
  #   expires_in =
  #     if expires_at do
  #       Timex.Format.DateTime.Formatters.Relative.format!(
  #         expires_at,
  #         "{relative}"
  #       )
  #     end

  #   download_url =
  #     PlausibleWeb.Router.Helpers.site_url(
  #       PlausibleWeb.Endpoint,
  #       :download_export,
  #       site.domain
  #     )

  #   priority_email()
  #   |> to(user)
  #   |> tag("export-success")
  #   |> subject("[#{Plausible.product_name()}] Your export is now ready for download")
  #   |> render("export_success.html",
  #     user: user,
  #     site: site,
  #     download_url: download_url,
  #     expires_in: expires_in
  #   )
  # end

  # def export_failure(user, site) do
  #   priority_email()
  #   |> to(user)
  #   |> subject("[#{Plausible.product_name()}] Your export has failed")
  #   |> render("export_failure.html", user: user, site: site)
  # end

  # def error_report(reported_by, trace_id, feedback) do
  #   Map.new()
  #   |> Map.put(:layout, nil)
  #   |> base_email()
  #   |> to("bugs@plausible.io")
  #   |> put_param("ReplyTo", reported_by)
  #   |> tag("sentry")
  #   |> subject("Feedback to Sentry Trace #{trace_id}")
  #   |> render("error_report_email.html", %{
  #     reported_by: reported_by,
  #     feedback: feedback,
  #     trace_id: trace_id
  #   })
  # end

  # def approaching_accept_traffic_until(notification) do
  #   base_email()
  #   |> to(notification.email)
  #   |> tag("drop-traffic-warning-first")
  #   |> subject("We'll stop counting your stats")
  #   |> render("approaching_accept_traffic_until.html",
  #     time: "next week",
  #     user: %{email: notification.email, name: notification.name}
  #   )
  # end

  # def approaching_accept_traffic_until_tomorrow(notification) do
  #   base_email()
  #   |> to(notification.email)
  #   |> tag("drop-traffic-warning-final")
  #   |> subject("A reminder that we'll stop counting your stats tomorrow")
  #   |> render("approaching_accept_traffic_until.html",
  #     time: "tomorrow",
  #     user: %{email: notification.email, name: notification.name}
  #   )
  # end

  @doc """
  Unlike the default 'base' emails, priority emails cannot be unsubscribed from. This is achieved
  by sending them through a dedicated 'priority' message stream in Postmark.
  """
  def priority_email(), do: priority_email(%{layout: "priority_email.html"})

  def priority_email(%{layout: layout}) do
    base_email(%{layout: layout})
  end

  def base_email(), do: base_email(%{layout: "base_email.html"})

  def base_email(%{layout: layout}) do
    mailer_from = mailer_email_from()

    new_email()
    |> from(mailer_from)
    |> maybe_put_layout(layout)
  end

  defp maybe_put_layout(email, nil), do: email

  defp maybe_put_layout(%{assigns: assigns} = email, layout) do
    %{email | assigns: Map.put(assigns, :layout, {EmailWeb.LayoutView, layout})}
  end

  @doc false
  def render(email, template, assigns \\ []) do
    assigns = Map.merge(email.assigns, Map.new(assigns))
    html = Phoenix.View.render_to_string(EmailWeb.EmailView, template, assigns)
    email |> html_body(html) |> text_body(textify(html))
  end

  def textify(html) do
    Floki.parse_fragment!(html)
    |> traverse_and_textify()
    |> Floki.text()
    |> collapse_whitespace()
  end

  defp traverse_and_textify([head | tail]) do
    [traverse_and_textify(head) | traverse_and_textify(tail)]
  end

  defp traverse_and_textify(text) when is_binary(text) do
    String.replace(text, "\n", "\s")
  end

  defp traverse_and_textify({"a", attrs, children}) do
    # assumes all anchor tags have href attribute
    {"href", href} = List.keyfind!(attrs, "href", 0)
    text = Floki.text(children)
    text = String.replace(text, "\n", "\s")

    if text == href do
      # avoids rendering "http://localhost:8000 (http://localhost:8000)" in base_email footer
      text
    else
      IO.iodata_to_binary([text, " (", href, ?)])
    end
  end

  defp traverse_and_textify(other), do: other

  defp collapse_whitespace(<<?\s, ?\s, rest::bytes>>) do
    collapse_whitespace(<<?\s, rest::bytes>>)
  end

  defp collapse_whitespace(<<?\s, ?\n, rest::bytes>>) do
    collapse_whitespace(<<?\n, rest::bytes>>)
  end

  defp collapse_whitespace(<<?\n, ?\s, rest::bytes>>) do
    collapse_whitespace(<<?\n, rest::bytes>>)
  end

  defp collapse_whitespace(<<c::1-bytes, rest::bytes>>) do
    c <> collapse_whitespace(rest)
  end

  defp collapse_whitespace(<<>>), do: <<>>
end
