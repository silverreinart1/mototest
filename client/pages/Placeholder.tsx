import BottomNav from "@/components/BottomNav";

interface PlaceholderProps {
  title: string;
}

export default function Placeholder({ title }: PlaceholderProps) {
  return (
    <div className="min-h-screen bg-white pb-32">
      <div className="max-w-md mx-auto px-4 pt-6 flex flex-col items-center justify-center h-screen">
        <h1 className="text-2xl font-bold text-black mb-4">{title}</h1>
        <p className="text-gray-600 text-center">
          This page is coming soon. Continue prompting to add content here!
        </p>
      </div>
      <BottomNav />
    </div>
  );
}
