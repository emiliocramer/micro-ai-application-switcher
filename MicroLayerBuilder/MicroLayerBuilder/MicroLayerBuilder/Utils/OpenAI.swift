struct OpenAIResponse: Codable {
    var choices: [Choice]
    
    struct Choice: Codable {
        var text: String
    }
}

func getShortcutsFor(appName: String, completion: @escaping ([String]) -> ()) {
    // URL for the OpenAI API (make sure to adjust if the endpoint changes in the future)
    let url = URL(string: "https://api.openai.com/v1/engines/davinci/completions")!

    // Construct the API request
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("Bearer \(getEnvironmentVariable(named: "OPENAI_API_KEY") ?? "")", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    // Your API query (you can adjust the prompt to be more specific)
    let body = [
        "prompt": "Provide 12 QMK shortcuts suitable for \(appName):",
        "max_tokens": 200
    ] as [String : Any]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])

    // Make the API request
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil,
              let apiResponse = try? JSONDecoder().decode(OpenAIResponse.self, from: data) else {
            completion([])
            return
        }

        // Process the response
        let shortcuts = apiResponse.choices.first?.text.split(separator: ",").map { String($0).trimmingCharacters(in: .whitespacesAndNewlines) } ?? []
        completion(shortcuts)
    }.resume()
}
