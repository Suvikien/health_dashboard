import { useState, useEffect} from "react";

type Stats = { patients: number; encounters: number };

function App() {

  const [stats, setStats] = useState<Stats | null>(null);
  const [error, setError] = useState<Error | null>(null);

  useEffect(() => {
    fetch("http://localhost:3000/api/stats")
        .then((res) => res.json())
        .then((data) => setStats(data))
        .catch(() => setError("Could not reach API"));
  }, []);

  if (error) return <p>{error}</p>;
  if (!stats) return <p>Loading...</p>;

  return(
      <>
        <h1>{stats.patients}</h1>
        <h1>{stats.encounters}</h1>
      </>
  )
}

export default App;