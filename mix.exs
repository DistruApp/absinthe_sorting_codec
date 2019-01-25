defmodule AbsintheSortingCodec.MixProject do
  use Mix.Project

  def project do
    [
      app: :absinthe_sdl,
      version: "1.0.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Absinthe Sorting JSON Encoder",
      description: "Encode Absinthe schemas to JSON, with array objects sorted by value of 'name' key",
      package: [
        maintainers: ["Nathan Hadfield"],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/maartenvanvliet/absinthe_sort_encode"},
        files: ~w(LICENSE README.md lib mix.exs)
      ],
      source_url: "https://github.com/hadfieldn/absinthe_sorting_codec",
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/fixtures"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:absinthe,
       git: "https://github.com/absinthe-graphql/absinthe.git",
       branch: "master",
       override: true,
       only: [:test]},
      {:jason, "~> 1.1.0"},
      {:ex_doc, "~> 0.19.0", only: [:dev]},
      {:mix_test_watch, "~> 0.8", only: [:test], runtime: false}
    ]
  end
end