defmodule EmailWeb.EmailTest do
  use ExUnit.Case, async: true
  alias EmailWeb.Email

  test "html to text" do
    email = Email.welcome_email(%{name: "John", email: "john@example.com"})

    assert email.html_body == """
           Hey John,
           <br><br>

           We are building Plausible to provide a simple and ethical approach to tracking website visitors.
           We're super excited to have you on board! <br><br>
           Here's how to get the most out of your Plausible experience: <br><br> *
           <a href="https://plausible.io/docs/email-reports">Enable email reports</a> and notifications for
           <a href="https://plausible.io/docs/traffic-spikes">traffic spikes</a>
           <br> *
           <a href="https://plausible.io/docs/google-search-console-integration">Integrate with Search Console</a> to get keyword phrases people find your site with<br>
           * <a href="https://plausible.io/docs/users-roles">Invite team members and other collaborators</a>
           <br> * Set up easy goals including
           <a href="https://plausible.io/docs/error-pages-tracking-404">404 error pages</a>,
           <a href="https://plausible.io/docs/file-downloads-tracking">file downloads</a> and
           <a href="https://plausible.io/docs/outbound-link-click-tracking">outbound link clicks</a>
           <br> * <a href="https://plausible.io/docs/excluding">Opt out from counting your own visits</a>
           <br> * If you're concerned about adblockers,
           <a href="https://plausible.io/docs/proxy/introduction">set up a proxy to bypass them</a>
           <br>
           <br><br> Then you're ready to start exploring your fast loading, ethical and actionable
           <a href="https://plausible.io/sites">Plausible dashboard</a>. <br><br>
           Have a question, feedback or need some guidance? Do reply back to this email.

           <br><br>

           \s\sRegards,<br> The Plausible Team 💌 <br><br>

           -- <br><br>
           <a href="http://localhost:4002">http://localhost:4002</a>
           <br>

           <span>{{{ pm:unsubscribe }}}</span>\
           """

    assert email.text_body == """
           Hey John,\s

           We are building Plausible to provide a simple and ethical approach to tracking website visitors. We're super excited to have you on board!\s

           Here's how to get the most out of your Plausible experience:\s

           * Enable email reports (https://plausible.io/docs/email-reports) and notifications for traffic spikes (https://plausible.io/docs/traffic-spikes)
           * Integrate with Search Console (https://plausible.io/docs/google-search-console-integration) to get keyword phrases people find your site with
           * Invite team members and other collaborators (https://plausible.io/docs/users-roles)
           * Set up easy goals including 404 error pages (https://plausible.io/docs/error-pages-tracking-404), file downloads (https://plausible.io/docs/file-downloads-tracking) and outbound link clicks (https://plausible.io/docs/outbound-link-click-tracking)
           * Opt out from counting your own visits (https://plausible.io/docs/excluding)
           * If you're concerned about adblockers, set up a proxy to bypass them (https://plausible.io/docs/proxy/introduction)


           Then you're ready to start exploring your fast loading, ethical and actionable Plausible dashboard (https://plausible.io/sites).\s

           Have a question, feedback or need some guidance? Do reply back to this email.\s

           Regards,
           The Plausible Team 💌\s

           --\s

           http://localhost:4002
           {{{ pm:unsubscribe }}}\
           """
  end
end
