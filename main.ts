import { UserAgent } from "@std/http/user-agent";

Deno.serve((req) => {
  const userAgent = new UserAgent(req.headers.get("user-agent") ?? "");
  return new Response(`Hello, ${userAgent.browser.name}
    on ${userAgent.os.name} ${userAgent.os.version}!`);
});
