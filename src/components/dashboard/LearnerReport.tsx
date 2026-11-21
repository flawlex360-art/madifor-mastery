import { Document, Page, Text, View, StyleSheet } from '@react-pdf/renderer';

interface ReportData {
  learner_name: string;
  learner_code: string;
  class_name: string;
  readiness_score: number;
  retained_count: number;
  first_pass_count: number;
  total_topics: number;
  topic_mastery: {
    topic_code: string;
    topic_name: string;
    first_pass_pct: number;
    status: string;
  }[];
}

const styles = StyleSheet.create({
  page: {
    paddingTop: 40,
    paddingHorizontal: 40,
    paddingBottom: 64,
    fontFamily: 'Helvetica',
  },
  header: {
    marginBottom: 20,
    borderBottom: '2px solid #1B2A4A',
    paddingBottom: 10,
  },
  title: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#1B2A4A',
  },
  subtitle: {
    fontSize: 10,
    color: '#64748b',
    marginTop: 4,
  },
  section: {
    marginBottom: 16,
  },
  sectionTitle: {
    fontSize: 12,
    fontWeight: 'bold',
    color: '#1B2A4A',
    marginBottom: 8,
  },
  row: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 4,
  },
  label: {
    fontSize: 10,
    color: '#64748b',
  },
  value: {
    fontSize: 10,
    fontWeight: 'bold',
    color: '#1B2A4A',
  },
  readinessBox: {
    borderRadius: 6,
    padding: 14,
    alignItems: 'center',
    marginBottom: 16,
  },
  readinessScore: {
    fontSize: 32,
    fontWeight: 'bold',
  },
  readinessLabel: {
    fontSize: 10,
    color: '#475569',
    marginTop: 2,
  },
  table: {
    marginTop: 8,
  },
  tableHeader: {
    flexDirection: 'row',
    backgroundColor: '#f1f5f9',
    paddingVertical: 5,
    paddingHorizontal: 8,
    borderBottom: '1px solid #e2e8f0',
  },
  tableHeaderText: {
    fontSize: 9,
    fontWeight: 'bold',
    color: '#334155',
  },
  tableRow: {
    flexDirection: 'row',
    paddingVertical: 4,
    paddingHorizontal: 8,
    borderBottom: '1px solid #f1f5f9',
  },
  tableCell: {
    fontSize: 9,
    color: '#1e293b',
  },
  colCode: { width: '20%' },
  colName: { width: '45%' },
  colPct: { width: '15%', textAlign: 'center' },
  colStatus: { width: '20%', textAlign: 'center' },
  footer: {
    position: 'absolute',
    bottom: 24,
    left: 40,
    right: 40,
    textAlign: 'center',
    fontSize: 8,
    color: '#94a3b8',
    borderTop: '1px solid #e2e8f0',
    paddingTop: 8,
  },
});

function getStatusColor(status: string): string {
  switch (status) {
    case 'retained_mastered': return '#16a34a';
    case 'first_pass_mastered': return '#d97706';
    case 'in_progress': return '#4f46e5';
    default: return '#94a3b8';
  }
}

function getStatusLabel(status: string): string {
  switch (status) {
    case 'retained_mastered': return 'Retained';
    case 'first_pass_mastered': return 'Mastered';
    case 'in_progress': return 'In Progress';
    default: return 'Not Started';
  }
}

function getReadinessTheme(score: number): { label: string; bg: string; border: string; text: string } {
  if (score >= 70) {
    return {
      label: 'Ready for BECE',
      bg: '#f0fdf4',
      border: '1px solid #86efac',
      text: '#16a34a',
    };
  }
  if (score >= 40) {
    return {
      label: 'Developing',
      bg: '#fffbeb',
      border: '1px solid #fcd34d',
      text: '#d97706',
    };
  }
  return {
    label: 'Early Stage',
    bg: '#fef2f2',
    border: '1px solid #fca5a5',
    text: '#dc2626',
  };
}

export default function LearnerReport({ data }: { data: ReportData }) {
  const safeScore = Math.max(0, Math.min(100, Math.round(data.readiness_score || 0)));
  const readinessTheme = getReadinessTheme(safeScore);

  return (
    <Document>
      <Page size="A4" style={styles.page}>
        {/* Header */}
        <View style={styles.header}>
          <Text style={styles.title}>Madifor Mastery — Learner Report</Text>
          <Text style={styles.subtitle}>
            Generated on {new Date().toLocaleDateString('en-GB', { day: 'numeric', month: 'long', year: 'numeric' })}
          </Text>
        </View>

        {/* Learner Info */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Learner Information</Text>
          <View style={styles.row}>
            <Text style={styles.label}>Name</Text>
            <Text style={styles.value}>{data.learner_name}</Text>
          </View>
          <View style={styles.row}>
            <Text style={styles.label}>ID</Text>
            <Text style={styles.value}>{data.learner_code || '—'}</Text>
          </View>
          <View style={styles.row}>
            <Text style={styles.label}>Class</Text>
            <Text style={styles.value}>{data.class_name || '—'}</Text>
          </View>
        </View>

        {/* BECE Readiness */}
        <View
          style={[
            styles.readinessBox,
            { backgroundColor: readinessTheme.bg, border: readinessTheme.border },
          ]}
        >
          <Text style={[styles.readinessScore, { color: readinessTheme.text }]}>
            {safeScore}%
          </Text>
          <Text style={styles.readinessLabel}>
            BECE Readiness — {readinessTheme.label}
          </Text>
        </View>

        {/* Summary Stats */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Mastery Summary</Text>
          <View style={styles.row}>
            <Text style={styles.label}>Retained Topics</Text>
            <Text style={styles.value}>{data.retained_count}</Text>
          </View>
          <View style={styles.row}>
            <Text style={styles.label}>First-Pass Mastered</Text>
            <Text style={styles.value}>{data.first_pass_count}</Text>
          </View>
          <View style={styles.row}>
            <Text style={styles.label}>Total Curriculum</Text>
            <Text style={styles.value}>{data.total_topics} topics</Text>
          </View>
        </View>

        {/* Topic Mastery Table */}
        {data.topic_mastery.length > 0 && (
          <View style={styles.section}>
            <Text style={styles.sectionTitle}>Topic Mastery Detail</Text>
            <View style={styles.table}>
              <View style={styles.tableHeader} fixed>
                <Text style={[styles.tableHeaderText, styles.colCode]}>Code</Text>
                <Text style={[styles.tableHeaderText, styles.colName]}>Topic</Text>
                <Text style={[styles.tableHeaderText, styles.colPct]}>Score</Text>
                <Text style={[styles.tableHeaderText, styles.colStatus]}>Status</Text>
              </View>
              {data.topic_mastery.map((tm, i) => (
                <View key={i} style={styles.tableRow} wrap={false}>
                  <Text style={[styles.tableCell, styles.colCode]}>{tm.topic_code || '—'}</Text>
                  <Text style={[styles.tableCell, styles.colName]}>{tm.topic_name}</Text>
                  <Text style={[styles.tableCell, styles.colPct]}>{Math.round(tm.first_pass_pct)}%</Text>
                  <Text style={[styles.tableCell, styles.colStatus, { color: getStatusColor(tm.status) }]}>
                    {getStatusLabel(tm.status)}
                  </Text>
                </View>
              ))}
            </View>
          </View>
        )}

        {/* Footer */}
        <Text style={styles.footer} fixed>
          Madifor Mastery — Topic-Based Assessment Platform for BECE Science
        </Text>
      </Page>
    </Document>
  );
}
