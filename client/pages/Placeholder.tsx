import BottomNav from "@/components/BottomNav";

interface PlaceholderProps {
  title: string;
}

export default function Placeholder({ title }: PlaceholderProps) {
  return (
    <div className="min-h-screen bg-gradient-to-b from-moto-dark via-moto-dark-lighter to-moto-dark pb-32 w-screen overflow-x-hidden flex flex-col">
      <div className="flex-1 flex flex-col items-center justify-center px-4">
        <div className="text-center">
          <h1 className="text-2xl font-bold text-white font-poppins mb-3">
            {title}
          </h1>
          <p className="text-gray-400 text-sm font-poppins">
            This page is coming soon. Keep riding!
          </p>
        </div>
      </div>
      <BottomNav />
    </div>
  );
}
