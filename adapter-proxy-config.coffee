class ProxyConfig

    adapter: "telegram"

    events: {
      shouldSend: (adapter, envelope, strings...) ->
        console.log envelope
        true
    }

module.exports = ProxyConfig